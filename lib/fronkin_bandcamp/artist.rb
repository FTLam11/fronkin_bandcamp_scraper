module FronkinBandcamp
  class Artist
    attr_reader :name, :photo, :location

    def initialize(doc)
      @name = doc.css('div#bio-container span.title').text
      @photo = doc.css('div#bio-container div.bio-pic a.popupImage').attribute('href').value
      @location = doc.css('div#bio-container span.location').text
    end
  end
end
