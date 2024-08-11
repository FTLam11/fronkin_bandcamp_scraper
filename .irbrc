require 'fronkin_bandcamp'
require 'awesome_print'

def reload!
  load 'fronkin_bandcamp/scraper.rb'
end

url = 'https://piglet.bandcamp.com/album/lava-land'
scraper = FronkinBandcamp::Scraper.new(url)
