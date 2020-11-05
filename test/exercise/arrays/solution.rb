module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.reduce { |current_max, item| item > current_max ? item : current_max }
        array.map { |item| item.positive? ? max : item }
      end

      def search(_array, _query)
        0
      end
    end
  end
end
