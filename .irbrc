require 'fronkin_bandcamp'
require 'awesome_print'

def reload!
  load 'fronkin_bandcamp/scraper.rb'
end

url = 'https://doncaballero.bandcamp.com/album/what-burns-never-returns'
scraper = FronkinBandcamp::Scraper.new(url)
puts scraper.url
