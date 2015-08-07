class API::MoviesController < API::ApplicationController
  def index
    movies = Movie.order(created_at: :desc)
    render json: movies
  end
end
