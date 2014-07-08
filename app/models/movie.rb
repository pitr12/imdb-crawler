class Movie < ActiveRecord::Base
  def self.parse_movies(html)
    site = Nokogiri::HTML(html)

    site.search('.title').each do |div|
      Movie.create!(
          title: div.search('a')[0].text,
          year: div.search('.year_type').text.match(/[0-9]+/).to_s.to_i,
          description: div.search('.outline').text,
          rating: div.search('.user_rating .rating-rating .value').text.to_f
      )
    end
  end
end
