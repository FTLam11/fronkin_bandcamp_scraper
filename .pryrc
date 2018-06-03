require 'fronkin_bandcamp_scraper'
require 'awesome_print'

def reload!
  load 'fronkin_bandcamp_scraper/scraper.rb'
end

url = 'https://piglet.bandcamp.com/album/lava-land'
scraper = FronkinBandcampScraper::Scraper.new(url)
