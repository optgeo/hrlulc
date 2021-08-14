require './constants'

while gets
  mbtiles_path = $_.strip.sub('.tif', '.tif.mbtiles')
  journal_path = "#{mbtiles_path}-journal"
  if File.exists?(mbtiles_path) && !File.exists?(journal_path)
    print $_
  end
end

