class Movie < ActiveRecord::Base
  has_many :categorizations
  has_many :genres, :through => :categorizations

  def self.parse_movies(html)
    site = Nokogiri::HTML(html)

    site.search('.title').each do |div|
      movie = Movie.create!(
          title: div.search('a')[0].text,
          year: div.search('.year_type').text.match(/[0-9]+/).to_s.to_i,
          description: div.search('.outline').text,
          rating: div.search('.user_rating .rating-rating .value').text.to_f,
          duration: div.search('.runtime').text.match(/[0-9]+/).to_s.to_i,
      )

      div.search('.genre a').each do |a|
        movie.categorizations.create!(
            genre_id: Genre.find_or_create_by!(name: a.text).id
       )
    end
    end
  end

end
