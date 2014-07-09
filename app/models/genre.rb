class Genre < ActiveRecord::Base
  has_many :categorizations
  has_many :movies, :through => :categorizations

  def self.parse_genres(html)
    site = Nokogiri::HTML(html)

    body = site.search('.article')[1]

    body.search('td a').each do |div|
      Genre.create!(
        name: div.text
      )
    end
  end
end
