module FronkinBandcampScraper
  class Release
    attr_accessor :title, :date, :formats, :cover, :tracks, :tags, :fans

    def initialize
      yield self if block_given?
    end
  end
end
