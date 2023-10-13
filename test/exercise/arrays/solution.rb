module Exercise
  module Arrays
    class << self
      def replace(array)
        max_array_value = array.max
        array.map { |el| el.positive? ? max_array_value : el }
      end

      def search(array, query)
        binary_search(0, array.count - 1, query, array)
      end

      def binary_search(left, right, query, array)
        return -1 if left > right

        mid = left + ((right - left) / 2)

        if array[mid] == query
          mid
        elsif array[mid] < query
          left = mid + 1
          binary_search(left, right, query, array)
        else
          right = mid - 1
          binary_search(left, right, query, array)
        end
      end
    end
  end
end
