module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_ratings = array.reject { |film| film['country'].nil? || film['country'].split(',').size < 2 }
                                .map { |film| film['rating_kinopoisk'].to_f }
                                .reject(&:zero?)

        return 0 if filtered_ratings.empty?

        filtered_ratings.reduce(:+) / filtered_ratings.size
      end

      def chars_count(_films, _threshold)
        0
      end
    end
  end
end
