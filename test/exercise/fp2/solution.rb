module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        iter = lambda do |index|
          return if index >= size

          block.call(self[index].dup)
          iter.call(index + 1)
        end

        iter.call(0) unless block.nil?
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        my_reduce(self.class.new) { |acc, el| acc << block.call(el) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(self.class.new) { |acc, el| el.nil? ? acc : acc << el }
      end

      # Написать свою функцию my_reduce
      def my_reduce(init = nil, &block)
        acc = init.nil? ? self[0].dup : init
        start_index = init.nil? ? 1 : 0

        iter = lambda do |index|
          return if index >= size

          acc = block.call(acc, self[index].dup)
          iter.call(index + 1)
        end

        iter.call(start_index) unless block.nil?
        acc
      end
    end
  end
end
