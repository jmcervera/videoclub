class API::SeasonsController < API::ApplicationController
  def index
    seasons = Season.includes(:episodes).order(created_at: :desc)
    render json: seasons
  end
end
