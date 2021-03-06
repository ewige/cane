require 'cane/encoding_aware_iterator'

module Cane

  # An interface for interacting with files that ensures encoding is handled in
  # a consistent manner.
  class File
    class << self
      def iterator(path)
        EncodingAwareIterator.new(open(path).lines)
      end

      def contents(path)
        open(path).read
      end

      def open(path)
        ::File.open(path, 'r:utf-8')
      end
    end
  end
end
