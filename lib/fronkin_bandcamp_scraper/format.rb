module FronkinBandcampScraper
  class Format
    attr_accessor :name, :items, :description, :product_images, :notes, :available

    def initialize(choice)
      @name = choice.css('h3.hd span').text.strip
      @items = choice.css('h3.hd div.secondaryText').text.strip
      @description = choice.css('div.bd').text.strip.gsub(/\n\s+/, ' ')
      @product_images = choice.css('a.popupImage').map { |anchor| anchor.attribute('href').value }
      @notes = choice.css('div.ft h4.main-button').text.strip.gsub(/\n\s+/, ' ')
      @available = choice.css('div.ft h4.notable').text.strip != 'Sold Out' ? true : false
    end
  end
end
