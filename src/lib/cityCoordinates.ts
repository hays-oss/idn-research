export const CITY_COORDS: Record<string, [number, number]> = {
  // Major convention cities
  "Las Vegas, NV": [36.1699, -115.1398],
  "Orlando, FL": [28.5383, -81.3792],
  "Chicago, IL": [41.8781, -87.6298],
  "Nashville, TN": [36.1627, -86.7816],
  "San Diego, CA": [32.7157, -117.1611],
  "San Francisco, CA": [37.7749, -122.4194],
  "New York, NY": [40.7128, -74.006],
  "Washington, DC": [38.9072, -77.0369],
  "Boston, MA": [42.3601, -71.0589],
  "Dallas, TX": [32.7767, -96.797],
  "Houston, TX": [29.7604, -95.3698],
  "San Antonio, TX": [29.4241, -98.4936],
  "Austin, TX": [30.2672, -97.7431],
  "Atlanta, GA": [33.749, -84.388],
  "Denver, CO": [39.7392, -104.9903],
  "Phoenix, AZ": [33.4484, -112.074],
  "Seattle, WA": [47.6062, -122.3321],
  "Minneapolis, MN": [44.9778, -93.265],
  "New Orleans, LA": [29.9511, -90.0715],
  "Miami, FL": [25.7617, -80.1918],
  "Philadelphia, PA": [39.9526, -75.1652],
  "Indianapolis, IN": [39.7684, -86.1581],
  "Charlotte, NC": [35.2271, -80.8431],
  "Salt Lake City, UT": [40.7608, -111.891],
  "Kansas City, MO": [39.0997, -94.5786],
  "Columbus, OH": [39.9612, -82.9988],
  "Louisville, KY": [38.2527, -85.7585],
  "Scottsdale, AZ": [33.4942, -111.9261],
  "Anaheim, CA": [33.8366, -117.9143],
  "Palm Springs, CA": [33.8303, -116.5453],
  "Savannah, GA": [32.0809, -81.0912],
  "Tampa, FL": [27.9506, -82.4572],
  "Portland, OR": [45.5152, -122.6784],
  "Grapevine, TX": [32.9343, -97.0781],
  "Coronado, CA": [32.6859, -117.1831],
  "National Harbor, MD": [38.7849, -77.0164],
  "Bonita Springs, FL": [26.3398, -81.7787],
  "Indian Wells, CA": [33.7178, -116.3417],
  "Marco Island, FL": [25.9412, -81.7184],
  "Amelia Island, FL": [30.6369, -81.4445],
  // International
  "Amsterdam, NL": [52.3676, 4.9041],
  "Berlin, DE": [52.52, 13.405],
  "London, UK": [51.5074, -0.1278],
  "Toronto, CA": [43.6532, -79.3832],
  "Paris, FR": [48.8566, 2.3522],
};

export function getCityCoords(
  city: string | null,
  state: string | null
): [number, number] | null {
  if (!city || !state) return null;
  const key = `${city}, ${state}`;
  return CITY_COORDS[key] ?? null;
}
