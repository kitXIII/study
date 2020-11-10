module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.reduce { |current_max, item| item > current_max ? item : current_max }
        array.map { |item| item.positive? ? max : item }
      end

      def search(array, query, first = 0)
        last = array.size - 1
        return -1 if last.negative?

        mid = last / 2

        return first + mid if array[mid] == query
        return search(array.slice(0, mid), query, first) if query < array[mid]
        return search(array.slice(mid + 1, last - mid), query, first + mid + 1) if query > array[mid]
      end
    end
  end
end
