module FronkinBandcampScraper
  class Format
    attr_accessor :name, :items, :description, :product_images, :notes

    def initialize(choice)
      @name = choice.css('h3.hd span').text.strip
      @items = choice.css('h3.hd div.secondaryText').text.strip
      @description = choice.css('div.bd').text.strip
      @product_images = choice.css('a.popupImage').map { |anchor| anchor.attribute('href').value }
      @notes = choice.css('div.ft').text.strip
    end
  end
end
