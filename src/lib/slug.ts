// Convert a free-text name into a URL-safe slug.
// "American Hospital Association" -> "american-hospital-association"
// "Women's Health & Resources" -> "womens-health-resources"
export function slugify(input: string): string {
  return input
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "") // strip diacritics
    .replace(/['']/g, "") // drop apostrophes inside words
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
}
