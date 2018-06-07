require 'open-uri'
require 'nokogiri'
require 'fronkin_bandcamp_scraper/release'
require 'fronkin_bandcamp_scraper/artist'

module FronkinBandcampScraper
  class Scraper
    attr_reader :doc, :release, :artist

    def initialize(url)
      @doc = Nokogiri::HTML(open(url)) { |config| config.noblanks }
      scrape
    end

    private

    def scrape
      @release = Release.new do |r|
        r.title = doc.css('div#name-section h2.trackTitle').text.strip
      end

      @artist = Artist.new do |a|
        a.name = doc.css('div#bio-container span.title').text
      end
    end
  end
end
