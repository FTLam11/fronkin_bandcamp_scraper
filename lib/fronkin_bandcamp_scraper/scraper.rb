require 'open-uri'
require 'nokogiri'
require 'fronkin_bandcamp_scraper/release'
require 'fronkin_bandcamp_scraper/artist'

module FronkinBandcampScraper
  class Scraper
    attr_reader :doc, :release, :artist

    def initialize(url)
      @doc = Nokogiri::HTML(open(url), nil, 'utf-8') { |config| config.noblanks }
      scrape
    end

    private

    def scrape
      @release = Release.new(doc)
      @artist = Artist.new do |artist|
        artist.name = doc.css('div#bio-container span.title').text
        artist.photo = doc.css('div#bio-container div.bio-pic a.popupImage').attribute('href').value
        artist.location = doc.css('div#bio-container span.location').text
      end
    end
  end
end
