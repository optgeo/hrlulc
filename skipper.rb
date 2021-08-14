require './constants'

while gets
  if CONTINUE
    mbtiles_path = $_.strip.sub('.tif', '.tif.mbtiles')
    journal_path = "#{mbtiles_path}-journal"
    next if File.exists?(mbtiles_path) && !File.exists?(journal_path)
  end
  print $_
end

