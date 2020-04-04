require 'fronkin_bandcamp/track'
require 'fronkin_bandcamp/format'

module FronkinBandcamp
  class Release
    attr_reader :title, :date, :cover, :tracks, :tags, :formats, :description

    def initialize(doc)
      @title = doc.css('div#name-section h2.trackTitle').text.strip
      @date = doc.css('div.tralbumData.tralbum-credits meta').attribute('content').value
      @cover = doc.css('div#tralbumArt a.popupImage').attribute('href').value
      @tracks = scrape_tracks(doc)
      @tags = doc.css('div.tralbumData.tralbum-tags a.tag').map(&:text)
      @formats = scrape_formats(doc)
      @description = doc.css('div.tralbumData.tralbum-about').text.strip.gsub(/\r/, "\n")
    end

    private

    def scrape_tracks(doc)
      track_titles = doc.css('table#track_table td.title-col span[itemprop="name"]').map(&:text)
      track_durations = doc.css('table#track_table td.title-col span.time').map { |node| node.text.strip }
      track_titles.zip(track_durations).map.with_index { |t, idx| Track.new(idx + 1, t[0], t[1]) }
    end

    def scrape_formats(doc)
      format_choices = doc.css('li.buyItem')
      format_choices.map { |choice| Format.new(choice) }
    end
  end
end
