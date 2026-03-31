import { Suspense } from "react";
import DirectoryPage from "@/components/directory/DirectoryPage";

export const metadata = {
  title: "Company Directory — IDN Research",
  description:
    "Browse 570+ healthcare companies across 14 domains and 57 market segments. Filter by organization, domain, subcategory, and tags.",
};

export default function DirectoryRoute() {
  return (
    <Suspense
      fallback={
        <div className="flex flex-1 items-center justify-center min-h-screen">
          <div className="text-center">
            <div className="h-8 w-8 animate-spin rounded-full border-2 border-primary border-t-transparent mx-auto mb-3" />
            <p className="text-sm text-muted">Loading directory...</p>
          </div>
        </div>
      }
    >
      <DirectoryPage />
    </Suspense>
  );
}
