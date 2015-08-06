class SeasonsController < ApplicationController
  before_action :set_season, only: [:show]
  def index
    @seasons = Season.all
  end

  def show
  end

  def new
    @season = Season.new
  end

  def create
    @season = Season.new(season_params)
    if @season.save
      flash[:notice] = "Season has been created."
      redirect_to @season
    else
      flash.now[:alert] = "Season has not been created."
      render 'new'
    end
  end



  private

  def set_season
    @season = Season.find(params[:id])
  end

  def season_params
    params.require(:season).permit(:title, :plot)
  end
end
