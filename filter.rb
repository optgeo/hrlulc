require 'json'
require './constants'

path = ENV['HRLULC']
t = File.basename(path, '.tif').split('_')[-1]
t = '10m' if t[0] == 'N'

tippecanoe = {
  :layer => LAYER,
  :minzoom => ZOOM_CONFIG[t]['minzoom'],
  :maxzoom => ZOOM_CONFIG[t]['maxzoom']
}

while gets
  f = JSON.parse($_)
  f['tippecanoe'] = tippecanoe
  print "\x1e#{JSON.dump(f)}\n"
end

