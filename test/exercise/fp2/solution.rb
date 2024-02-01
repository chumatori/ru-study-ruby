module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.
      # Написать свою функцию my_each
      def my_each(key = 0, &block)
        return self if key == length

        yield(self[key])
        my_each(key + 1, &block)
      end

      # Написать свою функцию my_map
      def my_map(result = self.class.new, key = 0, &block)
        return result if key == length

        result << yield(self[key])
        my_map(result, key + 1, &block)
      end

      # Написать свою функцию my_compact
      def my_compact
        result = self.class.new
        my_each { |key| result << key unless key.nil? }
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(*args)
        if block_given?
          acc, operator = args
        else
          operator, acc = args
        end

        if acc.nil?
          acc = self[0]
          key = 1
        else
          key = 0
        end

        my_each(key) { |element| acc = operator.nil? ? yield(acc, element) : operator.to_proc.call(acc, element) }
        acc
      end
    end
  end
end
