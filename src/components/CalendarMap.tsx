"use client";

import { useEffect, useState } from "react";
import { MeetingDate } from "@/lib/types";
import { getCityCoords } from "@/lib/cityCoordinates";

import "leaflet/dist/leaflet.css";
import { MapContainer, TileLayer, CircleMarker, Popup } from "react-leaflet";

const CAT_COLORS: Record<string, string> = {
  pharmacy: "#9333ea",
  "supply-chain": "#0e7490",
  "c-suite": "#065f46",
  technology: "#2563eb",
  clinical: "#dc2626",
  "revenue-cycle": "#d97706",
  facilities: "#059669",
  nursing: "#db2777",
  workforce: "#7c3aed",
};

interface Props {
  meetings: MeetingDate[];
}

export default function CalendarMap({ meetings }: Props) {
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
  }, []);

  if (!mounted) {
    return (
      <div className="w-full h-[500px] rounded-xl bg-cream-2 flex items-center justify-center">
        <p className="text-ink-muted text-sm">Loading map...</p>
      </div>
    );
  }

  const meetingsWithCoords = meetings
    .filter((m) => m.city && m.state_country)
    .map((m) => {
      const coords = getCityCoords(m.city, m.state_country);
      return coords ? { ...m, coords } : null;
    })
    .filter(
      (m): m is MeetingDate & { coords: [number, number] } => m !== null
    );

  // Group meetings by location to show multiple in one popup
  const grouped = new Map<
    string,
    Array<MeetingDate & { coords: [number, number] }>
  >();
  for (const m of meetingsWithCoords) {
    const key = m.coords.join(",");
    if (!grouped.has(key)) grouped.set(key, []);
    grouped.get(key)!.push(m);
  }

  return (
    <div className="w-full h-[500px] rounded-xl overflow-hidden border border-rule">
      <MapContainer
        center={[39.5, -98.35]}
        zoom={4}
        style={{ height: "100%", width: "100%" }}
        scrollWheelZoom={true}
      >
        <TileLayer
          attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        />
        {Array.from(grouped.entries()).map(([key, groupMeetings]) => {
          const color =
            CAT_COLORS[groupMeetings[0].category ?? ""] ?? "#1a1a2e";
          return (
            <CircleMarker
              key={key}
              center={groupMeetings[0].coords}
              radius={groupMeetings.length > 1 ? 10 : 7}
              pathOptions={{
                color: "white",
                weight: 2,
                fillColor: color,
                fillOpacity: 0.9,
              }}
            >
              <Popup>
                <div style={{ minWidth: 200 }}>
                  <div
                    style={{
                      fontWeight: 700,
                      fontSize: 11,
                      color: "#666",
                      textTransform: "uppercase",
                      letterSpacing: "0.05em",
                      marginBottom: 4,
                    }}
                  >
                    {groupMeetings[0].city}, {groupMeetings[0].state_country}
                  </div>
                  {groupMeetings.map((m) => (
                    <div
                      key={m.id}
                      style={{
                        borderTop: "1px solid #eee",
                        paddingTop: 6,
                        marginTop: 6,
                      }}
                    >
                      <div style={{ fontWeight: 600, fontSize: 13 }}>
                        {m.name}
                      </div>
                      <div style={{ fontSize: 11, color: "#888" }}>
                        {m.org_short}
                      </div>
                      {m.start_date && (
                        <div
                          style={{
                            fontSize: 11,
                            color: "#c5a84c",
                            fontWeight: 600,
                          }}
                        >
                          {m.start_date}
                          {m.end_date && m.end_date !== m.start_date
                            ? ` → ${m.end_date}`
                            : ""}
                        </div>
                      )}
                      {m.website_url && (
                        <a
                          href={m.website_url}
                          target="_blank"
                          rel="noopener noreferrer"
                          style={{ fontSize: 11, color: "#7f1d1d" }}
                        >
                          Visit website →
                        </a>
                      )}
                    </div>
                  ))}
                </div>
              </Popup>
            </CircleMarker>
          );
        })}
      </MapContainer>
    </div>
  );
}
