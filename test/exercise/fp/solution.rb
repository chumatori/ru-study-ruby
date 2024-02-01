module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        valid_films = array.map { |film| film if film_params_valid?(film) }.compact
        valid_films.reduce(0) { |acc, film| acc + film['rating_kinopoisk'].to_f } / valid_films.count
      end

      def chars_count(films, threshold, char = 'и')
        films.reduce(0) do |acc, film|
          film['rating_kinopoisk'].to_f >= threshold ? acc + film['name'].count(char) : acc
        end
      end

      private

      def film_params_valid?(film)
        multiple_countries?(film) && rating_valid?(film)
      end

      def multiple_countries?(film)
        return false if film['country'].nil?

        film['country'].split(',').count > 1
      end

      def rating_valid?(film)
        return false if film['rating_kinopoisk'].nil?

        film['rating_kinopoisk'].to_f.positive?
      end
    end
  end
end
