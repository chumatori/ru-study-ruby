module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.
      # Написать свою функцию my_each


      # В первую очередь нужно реализовать базовый итератор для each и reduce.
      # Затем, используя reduce, реализовать map и compact.

      # После завершения убедитесь, что тесты проходят, ошибок линтера нет, все закоммитьте,
      # создайте пулреквест в СВОЙ репозиторий, приложите ссылку на сайте обучения.


      def iterator(index = 0, &block)
        return self if index == length

        yield(self[index])
        iterator(index + 1, &block)
      end

      def my_each(&block)
        iterator(&block)
      end

      # Написать свою функцию my_reduce
      def my_reduce(*args)
        block_given? ? (acc, operator = args) : (operator, acc = args)

        index = 1
        acc.nil? ? acc = self[0] : index = 0

        iterator(index) { |element| acc = operator.nil? ? yield(acc, element) : operator.to_proc.call(acc, element) }
        acc
      end

      # Написать свою функцию my_map
      def my_map(&block)
        my_reduce(self.class.new) do |acc, element|
          acc << block.call(element)
          acc
        end
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(self.class.new) do |acc, element|
          acc << element unless element.nil?
          acc
        end
      end
    end
  end
end
