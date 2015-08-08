class API::SeasonsController < API::ApplicationController
  def index
    seasons = Season.list.page(params[:page]).per(params[:per_page])
    render json: seasons, meta: pagination(seasons, params[:per_page])
  end
end
