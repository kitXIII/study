module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.reduce { |current_max, item| item > current_max ? item : current_max }
        array.map { |item| item.positive? ? max : item }
      end

      def search(array, query)
        iter = lambda do |first, last|
          return -1 unless first <= last

          mid = (first + last) / 2

          return mid if array[mid] == query
          return iter.call(first, mid - 1) if query < array[mid]
          return iter.call(mid + 1, last) if query > array[mid]
        end

        iter.call(0, array.size - 1)
      end
    end
  end
end
