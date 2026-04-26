import { ImageResponse } from "next/og";

// Default OG image for the entire site. Individual route segments can
// override this by adding their own opengraph-image.tsx.

export const alt = "IDN Research — Healthcare Resource Intelligence";
export const size = { width: 1200, height: 630 };
export const contentType = "image/png";

export default async function Image() {
  return new ImageResponse(
    (
      <div
        style={{
          height: "100%",
          width: "100%",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          padding: 80,
          background:
            "linear-gradient(135deg, #1a3a2a 0%, #1a5632 60%, #2d7a4f 100%)",
          color: "white",
          fontFamily: "system-ui, sans-serif",
        }}
      >
        <div style={{ display: "flex", alignItems: "center", gap: 24 }}>
          <div
            style={{
              width: 80,
              height: 80,
              background: "#e8b53d",
              color: "#1a3a2a",
              borderRadius: 16,
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              fontSize: 36,
              fontWeight: 800,
              letterSpacing: -1,
            }}
          >
            IDN
          </div>
          <div
            style={{
              fontSize: 32,
              color: "rgba(255,255,255,0.85)",
              fontWeight: 500,
            }}
          >
            IDN Research
          </div>
        </div>

        <div style={{ display: "flex", flexDirection: "column", gap: 24 }}>
          <div
            style={{
              fontSize: 76,
              fontWeight: 800,
              lineHeight: 1.05,
              letterSpacing: -2,
              maxWidth: 980,
            }}
          >
            Healthcare Resource Intelligence
          </div>
          <div
            style={{
              fontSize: 28,
              color: "rgba(255,255,255,0.75)",
              maxWidth: 880,
              lineHeight: 1.35,
            }}
          >
            900+ curated companies, conferences, and resources across the
            healthcare industry — by IHES.
          </div>
        </div>

        <div
          style={{
            display: "flex",
            justifyContent: "space-between",
            alignItems: "center",
            color: "#e8b53d",
            fontSize: 24,
            fontWeight: 600,
          }}
        >
          <div>idnresearch.com</div>
          <div style={{ color: "rgba(255,255,255,0.6)", fontWeight: 400 }}>
            A project by IHES
          </div>
        </div>
      </div>
    ),
    { ...size }
  );
}
