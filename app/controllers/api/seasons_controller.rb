class API::SeasonsController < API::ApplicationController
  def index
    seasons = Season.includes(:episodes).order(created_at: :desc).
              page(params[:page]).per(params[:per_page])

    render json: seasons, meta: pagination(seasons, params[:per_page])
  end
end
