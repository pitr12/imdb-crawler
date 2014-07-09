class MovieController < ApplicationController
  def index
    @movies = Movie.paginate(:page => params[:page], :per_page => 20)
  end
end
