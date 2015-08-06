class EpisodesController < ApplicationController
  before_action :set_season
  before_action :set_episode, only: [:show, :edit, :update, :destroy]
  def new
    @episode = @season.episodes.build
  end

  def create
    @episode = @season.episodes.build(episode_params)
    if @episode.save
      flash[:notice] = "Episode has been created."
      redirect_to [@season, @episode]
    else
      flash.now[:alert] = "Episode has not been created."
      render 'new'
    end
  end

  def show
  end

  private
  def set_season
    @season = Season.find(params[:season_id])
  end

  def set_episode
    @episode = @season.episodes.find(params[:id])
  end

  def episode_params
    params.require(:episode).permit(:number, :title, :plot)
  end
end
