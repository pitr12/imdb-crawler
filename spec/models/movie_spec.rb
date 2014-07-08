require 'rails_helper'

RSpec.describe Movie, :type => :model do
  it 'parse movies' do
    response = Faraday.get 'http://www.imdb.com/search/title?count=100&title_type=feature,tv_series&ref_=nv_ch_mm_1'
    body = response.body

    Movie.parse_movies(body)

    expect(Movie.all.count).to eq(100)
 
    movie = Movie.all.first
    expect(movie.title).to eq("Transformers: Age of Extinction")
  end
end
