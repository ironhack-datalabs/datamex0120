import json
from shapely.geometry import shape, Point
import requests

# Download information
#req = requests.get('https://raw.githubusercontent.com/python-visualization/folium/master/examples/data/us_counties_20m_topo.json')
#tmp = json.loads(req.content)

# https://jeffpaine.github.io/geojson-topojson/

with open('counties.geojson') as f:
	counties = json.load(f)


def mapToPoly(lat, lon):

	point = Point(lon, lat)

	for feature in counties['features']:
		polygon = shape(feature['geometry'])
		
		try:
			if polygon.contains(point):
				return feature['id']
		except:
			return "error"

mapToPoly(47.603122, -122.333253)
#print(type(counties['features'][0].keys()))