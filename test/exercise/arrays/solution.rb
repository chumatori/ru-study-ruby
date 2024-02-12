module Exercise
  module Arrays
    class << self
      def find_max_array_value(array, _max = nil, _key = 0)
        array.reduce(array[0]) { |acc, element| element > acc ? element : acc }
      end

      def replace(array)
        max_array_value = find_max_array_value(array)
        array.map { |el| el.positive? ? max_array_value : el }
      end

      def search(array, query, left = 0, right = nil)
        right ||= array.count - 1
        return -1 if left > right
        return -1 if (query < array[left]) || (query > array[right])

        mid = left + ((right - left) / 2)

        return mid if array[mid] == query

        array[mid] < query ? search(array, query, mid + 1, right) : search(array, query, left, mid - 1)
      end
    end
  end
end
