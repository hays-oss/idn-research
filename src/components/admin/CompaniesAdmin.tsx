"use client";

import { useState } from "react";
import { Company, TaxonomyDomain, TaxonomySubcategory, CompanyType, ReviewStatus, Organization, CompanyAffiliation } from "@/lib/types";
import { supabase } from "@/lib/supabase";
import EditModal, { FormField, inputClass, selectClass } from "./EditModal";

interface CompaniesAdminProps {
  companies: Company[];
  domains: TaxonomyDomain[];
  subcategories: TaxonomySubcategory[];
  organizations: Organization[];
  affiliations: CompanyAffiliation[];
  onRefresh: () => void;
}

const COMPANY_TYPES: CompanyType[] = [
  "vendor",
  "manufacturer",
  "distributor",
  "gpo",
  "provider",
  "payer",
  "consultant",
  "media",
  "association",
  "other",
];

const REVIEW_STATUSES: ReviewStatus[] = [
  "pending",
  "approved",
  "rejected",
  "needs_review",
  "archived",
];

interface CompanyForm {
  company_name: string;
  website: string;
  linkedin_url: string;
  description: string;
  company_type: CompanyType;
  headquarters_city: string;
  headquarters_state: string;
  primary_domain_id: string;
  primary_subcategory_id: string;
  secondary_domain_id: string;
  secondary_subcategory_id: string;
  review_status: ReviewStatus;
  is_active: boolean;
  is_featured: boolean;
  notes: string;
}

const emptyForm: CompanyForm = {
  company_name: "",
  website: "",
  linkedin_url: "",
  description: "",
  company_type: "vendor",
  headquarters_city: "",
  headquarters_state: "",
  primary_domain_id: "",
  primary_subcategory_id: "",
  secondary_domain_id: "",
  secondary_subcategory_id: "",
  review_status: "pending",
  is_active: true,
  is_featured: false,
  notes: "",
};

function capitalize(s: string): string {
  return s.replace(/_/g, " ").replace(/\b\w/g, (c) => c.toUpperCase());
}

// Org badge colors
const ORG_COLORS: Record<string, string> = {
  IHES: "bg-green-100 text-green-700",
  CPES: "bg-blue-100 text-blue-700",
  CSCE: "bg-orange-100 text-orange-700",
  MUIA: "bg-purple-100 text-purple-700",
};

export default function CompaniesAdmin({
  companies,
  domains,
  subcategories,
  organizations,
  affiliations,
  onRefresh,
}: CompaniesAdminProps) {
  const [search, setSearch] = useState("");
  const [domainFilter, setDomainFilter] = useState("");
  const [statusFilter, setStatusFilter] = useState("");
  const [typeFilter, setTypeFilter] = useState("");
  const [modalOpen, setModalOpen] = useState(false);
  const [editingId, setEditingId] = useState<string | null>(null);
  const [form, setForm] = useState<CompanyForm>(emptyForm);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [selectedOrgIds, setSelectedOrgIds] = useState<string[]>([]);

  // Helper: find domain_id for a subcategory
  function getDomainIdForSubcategory(subcategoryId: number | null): string {
    if (!subcategoryId) return "";
    const sub = subcategories.find((s) => s.id === subcategoryId);
    return sub ? String(sub.domain_id) : "";
  }

  // Helper: get subcategory name
  function getSubcategoryName(subcategoryId: number | null): string {
    if (!subcategoryId) return "—";
    const sub = subcategories.find((s) => s.id === subcategoryId);
    return sub ? sub.name : "—";
  }

  // Filtered subcategories for cascading pickers
  const primarySubcategories = form.primary_domain_id
    ? subcategories.filter((s) => String(s.domain_id) === form.primary_domain_id)
    : [];

  const secondarySubcategories = form.secondary_domain_id
    ? subcategories.filter((s) => String(s.domain_id) === form.secondary_domain_id)
    : [];

  // Helper: get org codes for a company
  function getCompanyOrgCodes(companyId: string): string[] {
    const companyAffs = affiliations.filter((a) => a.company_id === companyId);
    return companyAffs
      .map((a) => organizations.find((o) => o.id === a.organization_id)?.code)
      .filter(Boolean) as string[];
  }

  // Helper: toggle org in selectedOrgIds
  function toggleOrg(orgId: string) {
    setSelectedOrgIds((prev) =>
      prev.includes(orgId) ? prev.filter((id) => id !== orgId) : [...prev, orgId]
    );
  }

  // Filter companies
  const filtered = companies.filter((c) => {
    const matchesSearch = c.company_name
      .toLowerCase()
      .includes(search.toLowerCase());
    const matchesDomain =
      !domainFilter ||
      getDomainIdForSubcategory(c.primary_subcategory_id) === domainFilter;
    const matchesStatus = !statusFilter || c.review_status === statusFilter;
    const matchesType = !typeFilter || c.company_type === typeFilter;
    return matchesSearch && matchesDomain && matchesStatus && matchesType;
  });

  function openAdd() {
    setEditingId(null);
    setForm(emptyForm);
    setSelectedOrgIds([]);
    setModalOpen(true);
  }

  function openEdit(company: Company) {
    setEditingId(company.id);
    setForm({
      company_name: company.company_name,
      website: company.website ?? "",
      linkedin_url: company.linkedin_url ?? "",
      description: company.description ?? "",
      company_type: company.company_type,
      headquarters_city: company.headquarters_city ?? "",
      headquarters_state: company.headquarters_state ?? "",
      primary_domain_id: getDomainIdForSubcategory(company.primary_subcategory_id),
      primary_subcategory_id: company.primary_subcategory_id
        ? String(company.primary_subcategory_id)
        : "",
      secondary_domain_id: getDomainIdForSubcategory(company.secondary_subcategory_id),
      secondary_subcategory_id: company.secondary_subcategory_id
        ? String(company.secondary_subcategory_id)
        : "",
      review_status: company.review_status,
      is_active: company.is_active,
      is_featured: company.is_featured,
      notes: company.notes ?? "",
    });
    // Load existing affiliations for this company
    const existingOrgIds = affiliations
      .filter((a) => a.company_id === company.id)
      .map((a) => a.organization_id);
    setSelectedOrgIds(existingOrgIds);
    setModalOpen(true);
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setIsSubmitting(true);

    const payload = {
      company_name: form.company_name,
      website: form.website || null,
      linkedin_url: form.linkedin_url || null,
      description: form.description || null,
      company_type: form.company_type,
      headquarters_city: form.headquarters_city || null,
      headquarters_state: form.headquarters_state || null,
      primary_subcategory_id: form.primary_subcategory_id
        ? parseInt(form.primary_subcategory_id)
        : null,
      secondary_subcategory_id: form.secondary_subcategory_id
        ? parseInt(form.secondary_subcategory_id)
        : null,
      review_status: form.review_status,
      is_active: form.is_active,
      is_featured: form.is_featured,
      notes: form.notes || null,
    };

    let companyId = editingId;

    if (editingId) {
      await supabase.from("companies").update(payload).eq("id", editingId);
    } else {
      const { data: newCompany } = await supabase
        .from("companies")
        .insert(payload)
        .select("id")
        .single();
      companyId = newCompany?.id ?? null;
    }

    // Sync affiliations
    if (companyId) {
      // Get current affiliations for this company
      const currentAffs = affiliations.filter((a) => a.company_id === companyId);
      const currentOrgIds = currentAffs.map((a) => a.organization_id);

      // Delete removed affiliations
      const toRemove = currentOrgIds.filter((id) => !selectedOrgIds.includes(id));
      if (toRemove.length > 0) {
        await supabase
          .from("company_affiliations")
          .delete()
          .eq("company_id", companyId)
          .in("organization_id", toRemove);
      }

      // Insert new affiliations
      const toAdd = selectedOrgIds.filter((id) => !currentOrgIds.includes(id));
      if (toAdd.length > 0) {
        const newAffs = toAdd.map((orgId) => ({
          company_id: companyId!,
          organization_id: orgId,
          membership_type: "member",
          is_active: true,
        }));
        await supabase.from("company_affiliations").insert(newAffs);
      }
    }

    setIsSubmitting(false);
    setModalOpen(false);
    onRefresh();
  }

  async function handleDelete(company: Company) {
    if (!window.confirm(`Delete "${company.company_name}"? This cannot be undone.`))
      return;
    await supabase.from("companies").delete().eq("id", company.id);
    onRefresh();
  }

  async function toggleActive(company: Company) {
    await supabase
      .from("companies")
      .update({ is_active: !company.is_active })
      .eq("id", company.id);
    onRefresh();
  }

  return (
    <div>
      {/* Toolbar */}
      <div className="mb-4 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
        <div className="flex flex-1 flex-wrap gap-3">
          <input
            type="text"
            placeholder="Search companies..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className={inputClass + " max-w-xs"}
          />
          <select
            value={domainFilter}
            onChange={(e) => setDomainFilter(e.target.value)}
            className={selectClass + " max-w-[180px]"}
          >
            <option value="">All Domains</option>
            {domains.map((d) => (
              <option key={d.id} value={String(d.id)}>
                {d.name}
              </option>
            ))}
          </select>
          <select
            value={statusFilter}
            onChange={(e) => setStatusFilter(e.target.value)}
            className={selectClass + " max-w-[160px]"}
          >
            <option value="">All Statuses</option>
            {REVIEW_STATUSES.map((s) => (
              <option key={s} value={s}>
                {capitalize(s)}
              </option>
            ))}
          </select>
          <select
            value={typeFilter}
            onChange={(e) => setTypeFilter(e.target.value)}
            className={selectClass + " max-w-[160px]"}
          >
            <option value="">All Types</option>
            {COMPANY_TYPES.map((t) => (
              <option key={t} value={t}>
                {capitalize(t)}
              </option>
            ))}
          </select>
        </div>
        <button
          onClick={openAdd}
          className="rounded-lg bg-[var(--primary)] px-4 py-2 text-sm font-medium text-white hover:bg-[var(--primary-light)] transition-colors"
        >
          Add Company
        </button>
      </div>

      {/* Table */}
      <div className="overflow-x-auto rounded-lg border border-[var(--border)]">
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b border-[var(--border)] bg-[var(--surface)]">
              <th className="px-4 py-3 text-left font-medium text-[var(--muted)]">
                Company Name
              </th>
              <th className="px-4 py-3 text-left font-medium text-[var(--muted)]">
                Primary Category
              </th>
              <th className="px-4 py-3 text-left font-medium text-[var(--muted)]">
                Type
              </th>
              <th className="px-4 py-3 text-left font-medium text-[var(--muted)]">
                Status
              </th>
              <th className="px-4 py-3 text-left font-medium text-[var(--muted)]">
                City / State
              </th>
              <th className="px-4 py-3 text-left font-medium text-[var(--muted)]">
                Orgs
              </th>
              <th className="px-4 py-3 text-center font-medium text-[var(--muted)]">
                Active
              </th>
              <th className="px-4 py-3 text-right font-medium text-[var(--muted)]">
                Actions
              </th>
            </tr>
          </thead>
          <tbody>
            {filtered.length === 0 ? (
              <tr>
                <td
                  colSpan={8}
                  className="px-4 py-8 text-center text-[var(--muted)]"
                >
                  No companies found.
                </td>
              </tr>
            ) : (
              filtered.map((company) => (
                <tr
                  key={company.id}
                  className="border-b border-[var(--border)] last:border-0 hover:bg-[var(--surface)] transition-colors"
                >
                  <td className="px-4 py-3 font-medium text-[var(--foreground)]">
                    {company.company_name.length > 40
                      ? company.company_name.slice(0, 40) + "..."
                      : company.company_name}
                  </td>
                  <td className="px-4 py-3 text-[var(--muted)]">
                    {getSubcategoryName(company.primary_subcategory_id)}
                  </td>
                  <td className="px-4 py-3 text-[var(--muted)]">
                    {capitalize(company.company_type)}
                  </td>
                  <td className="px-4 py-3">
                    <span
                      className={`inline-block rounded-full px-2 py-0.5 text-xs font-medium ${
                        company.review_status === "approved"
                          ? "bg-green-100 text-green-700"
                          : company.review_status === "rejected"
                          ? "bg-red-100 text-red-700"
                          : company.review_status === "needs_review"
                          ? "bg-yellow-100 text-yellow-700"
                          : company.review_status === "archived"
                          ? "bg-gray-100 text-gray-500"
                          : "bg-blue-100 text-blue-700"
                      }`}
                    >
                      {capitalize(company.review_status)}
                    </span>
                  </td>
                  <td className="px-4 py-3 text-[var(--muted)]">
                    {[company.headquarters_city, company.headquarters_state]
                      .filter(Boolean)
                      .join(", ") || "—"}
                  </td>
                  <td className="px-4 py-3">
                    <div className="flex flex-wrap gap-1">
                      {getCompanyOrgCodes(company.id).map((code) => (
                        <span
                          key={code}
                          className={`inline-block rounded-full px-2 py-0.5 text-xs font-medium ${
                            ORG_COLORS[code] || "bg-gray-100 text-gray-600"
                          }`}
                        >
                          {code}
                        </span>
                      ))}
                    </div>
                  </td>
                  <td className="px-4 py-3 text-center">
                    <button
                      onClick={() => toggleActive(company)}
                      className={`inline-flex h-5 w-9 items-center rounded-full transition-colors ${
                        company.is_active ? "bg-[var(--primary)]" : "bg-gray-300"
                      }`}
                    >
                      <span
                        className={`inline-block h-4 w-4 transform rounded-full bg-white shadow transition-transform ${
                          company.is_active
                            ? "translate-x-4"
                            : "translate-x-0.5"
                        }`}
                      />
                    </button>
                  </td>
                  <td className="px-4 py-3 text-right">
                    <div className="flex items-center justify-end gap-2">
                      <button
                        onClick={() => openEdit(company)}
                        className="rounded-md px-2 py-1 text-xs font-medium text-[var(--primary)] hover:bg-[var(--primary)]/10 transition-colors"
                      >
                        Edit
                      </button>
                      <button
                        onClick={() => handleDelete(company)}
                        className="rounded-md px-2 py-1 text-xs font-medium text-red-600 hover:bg-red-50 transition-colors"
                      >
                        Delete
                      </button>
                    </div>
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>

      {/* Add / Edit Modal */}
      <EditModal
        title={editingId ? "Edit Company" : "Add Company"}
        isOpen={modalOpen}
        onClose={() => setModalOpen(false)}
        onSubmit={handleSubmit}
        isSubmitting={isSubmitting}
      >
        <FormField label="Company Name" required>
          <input
            type="text"
            required
            value={form.company_name}
            onChange={(e) => setForm({ ...form, company_name: e.target.value })}
            className={inputClass}
          />
        </FormField>

        <FormField label="Website">
          <input
            type="url"
            value={form.website}
            onChange={(e) => setForm({ ...form, website: e.target.value })}
            className={inputClass}
            placeholder="https://..."
          />
        </FormField>

        <FormField label="LinkedIn URL">
          <input
            type="url"
            value={form.linkedin_url}
            onChange={(e) => setForm({ ...form, linkedin_url: e.target.value })}
            className={inputClass}
            placeholder="https://www.linkedin.com/company/..."
          />
        </FormField>

        <FormField label="Description">
          <textarea
            value={form.description}
            onChange={(e) => setForm({ ...form, description: e.target.value })}
            className={inputClass}
            rows={3}
          />
        </FormField>

        <FormField label="Company Type">
          <select
            value={form.company_type}
            onChange={(e) =>
              setForm({ ...form, company_type: e.target.value as CompanyType })
            }
            className={selectClass}
          >
            {COMPANY_TYPES.map((t) => (
              <option key={t} value={t}>
                {capitalize(t)}
              </option>
            ))}
          </select>
        </FormField>

        <div className="grid grid-cols-2 gap-4">
          <FormField label="Headquarters City">
            <input
              type="text"
              value={form.headquarters_city}
              onChange={(e) =>
                setForm({ ...form, headquarters_city: e.target.value })
              }
              className={inputClass}
            />
          </FormField>
          <FormField label="Headquarters State">
            <input
              type="text"
              value={form.headquarters_state}
              onChange={(e) =>
                setForm({ ...form, headquarters_state: e.target.value })
              }
              className={inputClass}
            />
          </FormField>
        </div>

        {/* Primary Category - Cascading Picker */}
        <FormField label="Primary Category">
          <div className="grid grid-cols-2 gap-3">
            <select
              value={form.primary_domain_id}
              onChange={(e) =>
                setForm({
                  ...form,
                  primary_domain_id: e.target.value,
                  primary_subcategory_id: "",
                })
              }
              className={selectClass}
            >
              <option value="">Select Domain</option>
              {domains.map((d) => (
                <option key={d.id} value={String(d.id)}>
                  {d.name}
                </option>
              ))}
            </select>
            <select
              value={form.primary_subcategory_id}
              onChange={(e) =>
                setForm({ ...form, primary_subcategory_id: e.target.value })
              }
              className={selectClass}
              disabled={!form.primary_domain_id}
            >
              <option value="">Select Subcategory</option>
              {primarySubcategories.map((s) => (
                <option key={s.id} value={String(s.id)}>
                  {s.name}
                </option>
              ))}
            </select>
          </div>
        </FormField>

        {/* Secondary Category - Cascading Picker */}
        <FormField label="Secondary Category (Optional)">
          <div className="grid grid-cols-2 gap-3">
            <select
              value={form.secondary_domain_id}
              onChange={(e) =>
                setForm({
                  ...form,
                  secondary_domain_id: e.target.value,
                  secondary_subcategory_id: "",
                })
              }
              className={selectClass}
            >
              <option value="">Select Domain</option>
              {domains.map((d) => (
                <option key={d.id} value={String(d.id)}>
                  {d.name}
                </option>
              ))}
            </select>
            <select
              value={form.secondary_subcategory_id}
              onChange={(e) =>
                setForm({ ...form, secondary_subcategory_id: e.target.value })
              }
              className={selectClass}
              disabled={!form.secondary_domain_id}
            >
              <option value="">Select Subcategory</option>
              {secondarySubcategories.map((s) => (
                <option key={s.id} value={String(s.id)}>
                  {s.name}
                </option>
              ))}
            </select>
          </div>
        </FormField>

        <FormField label="Review Status">
          <select
            value={form.review_status}
            onChange={(e) =>
              setForm({
                ...form,
                review_status: e.target.value as ReviewStatus,
              })
            }
            className={selectClass}
          >
            {REVIEW_STATUSES.map((s) => (
              <option key={s} value={s}>
                {capitalize(s)}
              </option>
            ))}
          </select>
        </FormField>

        <div className="flex items-center gap-6">
          <label className="flex items-center gap-2 text-sm text-[var(--foreground)]">
            <input
              type="checkbox"
              checked={form.is_active}
              onChange={(e) => setForm({ ...form, is_active: e.target.checked })}
              className="rounded border-[var(--border)] text-[var(--primary)] focus:ring-[var(--primary)]"
            />
            Active
          </label>
          <label className="flex items-center gap-2 text-sm text-[var(--foreground)]">
            <input
              type="checkbox"
              checked={form.is_featured}
              onChange={(e) =>
                setForm({ ...form, is_featured: e.target.checked })
              }
              className="rounded border-[var(--border)] text-[var(--primary)] focus:ring-[var(--primary)]"
            />
            Featured
          </label>
        </div>

        <FormField label="Organization Affiliations">
          <div className="flex flex-wrap gap-3">
            {organizations.map((org) => (
              <label
                key={org.id}
                className={`flex items-center gap-2 rounded-lg border px-3 py-2 text-sm cursor-pointer transition-colors ${
                  selectedOrgIds.includes(org.id)
                    ? "border-[var(--primary)] bg-[var(--primary)]/10 text-[var(--primary)] font-medium"
                    : "border-[var(--border)] text-[var(--muted)] hover:border-[var(--primary)]/50"
                }`}
              >
                <input
                  type="checkbox"
                  checked={selectedOrgIds.includes(org.id)}
                  onChange={() => toggleOrg(org.id)}
                  className="rounded border-[var(--border)] text-[var(--primary)] focus:ring-[var(--primary)]"
                />
                {org.code}
              </label>
            ))}
          </div>
        </FormField>

        <FormField label="Notes">
          <textarea
            value={form.notes}
            onChange={(e) => setForm({ ...form, notes: e.target.value })}
            className={inputClass}
            rows={3}
          />
        </FormField>
      </EditModal>
    </div>
  );
}
