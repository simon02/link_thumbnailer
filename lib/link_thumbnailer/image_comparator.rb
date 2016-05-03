require 'link_thumbnailer/image_comparators/base'
require 'link_thumbnailer/image_comparators/size'
require 'link_thumbnailer/image_comparators/origin'

module LinkThumbnailer
  class ImageComparator

    attr_reader :image

    def initialize(image)
      @image = image
    end

    def call(other)
      result = origin_comparator.call(other)
      # only compare size if origin is indecisive
      if result == 0
        size_comparator.call(other)
      else
        result
      end
    end

    private

    def size_comparator
      ::LinkThumbnailer::ImageComparators::Size.new(image)
    end

    def origin_comparator
      ::LinkThumbnailer::ImageComparators::Origin.new(image)
    end

  end
end
