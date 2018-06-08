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
        r.date = doc.css('div.tralbumData.tralbum-credits meta').attribute('content').value
        r.cover = doc.css('div#tralbumArt a.popupImage').attribute('href').value
      end

      @artist = Artist.new do |a|
        a.name = doc.css('div#bio-container span.title').text
        a.photo = doc.css('div#bio-container div.bio-pic a.popupImage').attribute('href').value
        a.location = doc.css('div#bio-container span.location').text
      end
    end
  end
end
