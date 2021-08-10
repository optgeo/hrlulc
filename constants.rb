require 'yaml'

# directories and paths
SRC_DIR = 'src'
MBTILES_PATH = '10m.mbtiles'
TILES_DIR = 'docs/zxy'

# sources
DOWNLOAD_URLS = %w{
  https://www.eorc.jaxa.jp/ALOS/lulc/data/ver2103_LC_GeoTiff.zip
  https://www.eorc.jaxa.jp/ALOS/lulc/data/ver2103_LC_GeoTiff_50m.zip
  https://www.eorc.jaxa.jp/ALOS/lulc/data/ver2103_LC_GeoTiff_100m.tif.zip
  https://www.eorc.jaxa.jp/ALOS/lulc/data/ver2103_LC_GeoTiff_250m.tif.zip
  https://www.eorc.jaxa.jp/ALOS/lulc/data/ver2103_LC_GeoTiff_500m.tif.zip
}
DOWNLOAD_USER = 'YOUR_USERNAME'
DOWNLOAD_PASSWORD = 'YOUR_PASSWORD'

# vector tile design configurations
LAYER = 'hrlulc'
PROPERTY = 'a'
MINZOOM = 6
MAXZOOM = 13 ###
ZOOM_CONFIG = YAML.load <<-EOS
10m: 
  maxzoom: 14
  minzoom: 14
50m:
  maxzoom: 13
  minzoom: 11
100m:
  maxzoom: 10
  minzoom: 10
250m:
  maxzoom: 9
  minzoom: 9
500m:
  maxzoom: 8
  minzoom: 6
EOS

# vector tile style configurations
PHOTO_OPACITY = 0.5
BASE_STYLE_URL = 'https://gsi-cyberjapan.github.io/gsivectortile-mapbox-gl-js/pale.json'
BACKGROUND_COLOR = 'rgb(255, 255, 255)'
MASK_COLOR = 'rgb(189, 189, 189)'
COLOR_MAP = YAML.load <<-EOS
  - match
  -
    - get
    - #{PROPERTY}
  - 1
  - rgb(0, 0, 100)
  - 2
  - rgb(255, 0, 0)
  - 3
  - rgb(0, 128, 255)
  - 4
  - rgb(255, 193, 191)
  - 5
  - rgb(255, 255, 0)
  - 6
  - rgb(128, 255, 0)
  - 7
  - rgb(0, 255, 128)
  - 8
  - rgb(86, 172, 0)
  - 9
  - rgb(0, 172, 86)
  - 10
  - rgb(128, 100, 0)
  - 11
  - rgb(217, 240, 5)
  - 12
  - rgb(161, 41, 119)
  - rgba(0, 0, 0, 0)
EOS

# hosting configuration
BASE_URL = 'http://60.81.3.177'

