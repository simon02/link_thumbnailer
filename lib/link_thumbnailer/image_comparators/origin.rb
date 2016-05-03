module LinkThumbnailer
  module ImageComparators
    class Origin < ::LinkThumbnailer::ImageComparators::Base

      def call(other)
        # origin opengraph gets priority!
        o = other.origin.to_s == 'og' ? 1 : 0
        s = image.origin.to_s == 'og' ? 1 : 0
        o.to_i <=> s.to_i
      end

    end
  end
end
