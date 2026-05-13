import { Metadata } from "next";
import { getAllMeetingDates } from "@/lib/resourceQueries";
import CalendarView from "@/components/CalendarView";

export const revalidate = 300;

export const metadata: Metadata = {
  title: "Industry Meeting Calendar — IDN Research",
  description:
    "Every major healthcare industry meeting in one place — dates, locations, and categories. Pharmacy, supply chain, technology, and executive conferences tracked and updated quarterly.",
  openGraph: {
    title: "Industry Meeting Calendar — IDN Research",
    description:
      "Every major healthcare industry meeting in one place — dates, locations, and categories.",
  },
};

export default async function CalendarPage() {
  const meetings = await getAllMeetingDates();

  return (
    <main className="min-h-screen bg-cream">
      <CalendarView meetings={meetings} />
    </main>
  );
}
