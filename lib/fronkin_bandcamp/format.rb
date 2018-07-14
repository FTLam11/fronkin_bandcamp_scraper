module FronkinBandcamp
  module CleanAsFuck
    refine String do
      def kleanse
        strip.gsub!(/\n\s+/, ' ')
      end
    end
  end

  using CleanAsFuck

  class Format
    attr_accessor :name, :product, :description, :product_images, :price, :is_available

    def initialize(choice)
      @name = choice.css('h3.hd span').text.kleanse || 'Subcription'
      @product = choice.css('h3.hd div.secondaryText').text.strip
      @description = choice.css('div.bd').text.kleanse
      @product_images = choice.css('a.popupImage').map { |anchor| anchor.attribute('href').value }
      @price = choice.css('div.ft h4.main-button').text.kleanse || choice.css('h4.ft.compound-button').text.kleanse
      @is_available = choice.css('div.ft h4.notable').text.strip != 'Sold Out' ? true : false
    end
  end
end
