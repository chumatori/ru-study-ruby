module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      def iterate(el=0)
        while(el < length)
          yield(el, self[el])
          el += 1
        end
      end
      
      # Написать свою функцию my_each
      def my_each #my_array.my_each {|v| puts v}
        iterate {|i, v| yield(v)}
        # el = 0
        # while el < length
        #   yield(self[el])
        #   el += 1
        # end
        self
      end

      # Написать свою функцию my_map
      def my_map
        result = self.class.new(length)
        iterate() { |i, v| result[i] = yield(v) }
        # el = 0
        # while el < length
        #   result[el] = yield(self[el])
        #   el += 1
        # end
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = self.class.new
        el = 0
        while el < length
          result.my_push(self[el]) unless self[el].nil?
          el += 1
        end
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
          el = 1
        else
          el = 0
        end

        while(el < length)
          acc = operator.nil? ? yield(acc, self[el]) : operator.to_proc.call(acc, self[el])
          el += 1
        end
        acc
      end

      def my_push(element)
        self[length] = element
      end


    end
  end
end
