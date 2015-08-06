class SeasonsController < ApplicationController
  before_action :set_season, only: [:show, :edit, :update, :destroy]
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

  def edit
  end

  def update
    if @season.update(season_params)
      flash[:notice] = "Season has been updated."
      redirect_to @season
    else
      flash.now[:alert] = "Season has not been updated."
      render 'edit'
    end
  end

  def destroy
    @season.destroy
    flash[:notice] = "Season has been deleted."
    redirect_to seasons_url
  end



  private

  def set_season
    @season = Season.find(params[:id])
  rescue
    flash[:alert] = "The season you were looking for could not be found."
    redirect_to seasons_url
  end

  def season_params
    params.require(:season).permit(:title, :plot)
  end
end
