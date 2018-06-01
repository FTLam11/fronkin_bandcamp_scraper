require 'open-uri'
require 'nokogiri'

module FronkinBandcampScraper
  class Scraper
    attr_reader :doc, :release_title, :artist_name

    def initialize(url)
      @doc = Nokogiri::HTML(open(url)) { |config| config.noblanks }
      scrape
    end

    private

    def scrape
      @release_title = doc.css('h2.trackTitle').text.strip
      @artist_name = doc.css('span.title').text
    end
  end
end
