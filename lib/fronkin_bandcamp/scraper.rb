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
      @artist = Artist.new(doc)
      @release = Release.new(doc) do |release|
        release.artist_name = artist.name
        release.bandcamp_url = url
      end
    end
  end
end
