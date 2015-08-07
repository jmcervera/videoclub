class API::MoviesController < API::ApplicationController
  def index
    movies = Movie.order(created_at: :desc).
             page(params[:page]).per(params[:per_page])

    render json: movies, meta: pagination(movies, params[:per_page])
  end
end
