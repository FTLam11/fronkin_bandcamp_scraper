module FronkinBandcampScraper
  class Format
    attr_accessor :name, :product, :description, :product_images, :price, :is_available

    def initialize(choice)
      @name = sanitize(choice.css('h3.hd span').text) || 'Subcription'
      @product = choice.css('h3.hd div.secondaryText').text.strip
      @description = sanitize(choice.css('div.bd').text)
      @product_images = choice.css('a.popupImage').map { |anchor| anchor.attribute('href').value }
      @price = sanitize(choice.css('div.ft h4.main-button').text) || sanitize(choice.css('h4.ft.compound-button').text)
      @is_available = choice.css('div.ft h4.notable').text.strip != 'Sold Out' ? true : false
    end

    private

    def sanitize(text)
      text.strip.gsub!(/\n\s+/, ' ')
    end
  end
end
