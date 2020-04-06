require 'open-uri'
require 'nokogiri'
require 'fronkin_bandcamp/release'
require 'fronkin_bandcamp/artist'

module FronkinBandcamp
  class Scraper
    attr_reader :doc, :release, :artist, :url

    def initialize(url)
      @url = url
      @doc = Nokogiri::HTML(URI.open(url), nil, 'utf-8') { |config| config.noblanks }
      scrape
    end

    private

    def scrape
      @release = Release.new(doc) { |release| release.bandcamp_url = url }

      @artist = Artist.new do |artist|
        artist.name = doc.css('div#bio-container span.title').text
        artist.photo = doc.css('div#bio-container div.bio-pic a.popupImage').attribute('href').value
        artist.location = doc.css('div#bio-container span.location').text
      end
    end
  end
end
