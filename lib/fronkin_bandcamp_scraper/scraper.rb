require 'open-uri'
require 'nokogiri'

module FronkinBandcampScraper
  class Scraper
    attr_reader :doc

    def initialize(url)
      @doc = Nokogiri::HTML(open(url)) { |config| config.noblanks }
    end
  end
end
