require 'konjak/tmx_segmentor/segment_string'
require 'konjak/tmx_segmentor/strategy'

module Konjak
  class TmxSegmentor < Segmentor
    class GttHtmlStrategy < Strategy

      private

      def split(translation_unit, text)
        segment = translation_unit.variant(@lang).segment
        pattern = segment.compile_gtt_html_pattern

        texts = []
        while true
          head, match, tail = text.partition(pattern)
          break if match.empty? || text.length < min_segment_length
          texts << head unless head.empty?

          texts << SegmentString.new(match, segment)

          text = tail
        end
        texts << text
      end
    end
  end
end
