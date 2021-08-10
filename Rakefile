require './constants'
require 'find'

desc 'download and extract HRLULC files'
task :download do
  DOWNLOAD_URLS.reverse.each {|url|
    fn = url.split('/')[-1]
    sh "curl -C - --user #{DOWNLOAD_USER}:#{DOWNLOAD_PASSWORD} -O #{url}"
    sh "unzip -d #{SRC_DIR} #{fn}"
    sh "rm #{fn}"
  }
end

desc 'list files'
task :_list do
  Find.find(SRC_DIR) {|path|
    next unless /\.tif$/.match path ###
    next if /m\.tif$/.match path ###
    print "#{path}\n"
  }
end

desc 'stream features'
task :_stream do
  sh <<-EOS
rake _list | 
parallel -j 4 --line-buffer \
'gdal_polygonize.py {} -f GeoJSONSeq \
-q /vsistdout #{LAYER} #{PROPERTY} | \
HRLULC={} ruby filter.rb'
  EOS
end

desc 'produce mbtiles'
task :_mbtiles do
  sh <<-EOS
rake _stream |
tippecanoe --force -o #{MBTILES_PATH} \
--no-tile-size-limit --no-feature-limit \
--minimum-zoom=#{MINZOOM} --maximum-zoom=#{MAXZOOM}
  EOS
end

desc 'extract from mbtiles'
task :_extract do
  sh <<-EOS
tile-join --force --no-tile-compression \
--output-to-directory=#{TILES_DIR} --no-tile-size-limit \
#{MBTILES_PATH}
  EOS
end

desc 'execute vt-optimizer'
task :optimize do
  sh <<-EOS
node ~/vt-optimizer/index.js -m #{MBTILES_PATH}
  EOS
end

desc 'build style.json'
task :style do
  sh <<-EOS
curl #{BASE_STYLE_URL} |
ruby style.rb > docs/style.json
  EOS
end

desc 'host the site'
task :host do
  sh 'budo -d docs'
end

