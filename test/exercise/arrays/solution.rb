module Exercise
  module Arrays
    class << self
      def find_max_array_value(array, max = nil, key = 0)
        return max if key == array.size

        max = array[0] if max.nil?
        max = array[key] if array[key] > max
        find_max_array_value(array, max, key + 1)
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
