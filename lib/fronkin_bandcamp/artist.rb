module FronkinBandcamp
  class Artist
    attr_accessor :name, :photo, :location

    def initialize
      yield self if block_given?
    end
  end
end
