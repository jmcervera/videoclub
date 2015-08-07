class API::MoviesController < ApplicationController
  def index
    movies = Movie.order(created_at: :desc)
    render json: movies
  end
end
