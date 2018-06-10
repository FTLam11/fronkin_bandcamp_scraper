require 'fronkin_bandcamp_scraper/track'

module FronkinBandcampScraper
  class Release
    attr_accessor :doc, :title, :date, :formats, :cover, :tracks, :tags, :fans

    def initialize(doc)
      @doc = doc
      @title = doc.css('div#name-section h2.trackTitle').text.strip
      @date = doc.css('div.tralbumData.tralbum-credits meta').attribute('content').value
      @cover = doc.css('div#tralbumArt a.popupImage').attribute('href').value
      @tracks = scrape_tracks
    end

    private

    def scrape_tracks
      track_titles = doc.css('table#track_table td.title-col span[itemprop="name"]').map(&:text)
      track_durations = doc.css('table#track_table td.title-col span.time').map { |node| node.text.strip }
      track_titles.zip(track_durations).map.with_index { |t, idx| Track.new(idx + 1, t[0], t[1]) }
    end
  end
end
