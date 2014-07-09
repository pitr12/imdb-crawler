require 'rails_helper'

RSpec.describe Genre, :type => :model do
  it 'should parse_genres' do
    response = Faraday.get 'http://www.imdb.com/genre/?ref_=nv_ch_gr_5'
    body = response.body

    Genre.parse_genres(body)

    expect(Genre.all.count).to eq(26)

    genre = Genre.all.first
    expect(genre.name).to eq("Action")
  end
end
