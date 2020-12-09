module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(index = 0, &block)
        return self if index >= size

        yield self[index].dup if block_given?
        my_each(index + 1, &block)
      end

      # Написать свою функцию my_map
      def my_map
        return self unless block_given?

        my_reduce(self.class.new) do |acc, item|
          result = yield item
          acc << result
        end
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(self.class.new) { |acc, el| el.nil? ? acc : acc << el }
      end

      # Написать свою функцию my_reduce
      def my_reduce(init = nil)
        acc = init.nil? ? self[0].dup : init
        start_index = init.nil? ? 1 : 0

        my_each(start_index) { |item| acc = yield acc, item }
        acc
      end
    end
  end
end
