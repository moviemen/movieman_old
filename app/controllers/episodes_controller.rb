class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @episodes = params[:search] ? Episode.where(name: params[:search]) : current_user.episodes
    respond_with(@episodes)
  end

  def show
    respond_with(@episode)
  end

  def new
    @episode = Episode.new
    respond_with(@episode)
  end

  def edit
  end

  def create
    @episode = Episode.new(episode_params)
    @episode.save
    respond_with(@episode)
  end

  def update
    @episode.update(episode_params)
    respond_with(@episode)
  end

  def destroy
    current_user.episodes.delete @episode
    #@episode.destroy
    redirect_to episodes_path
  end

  def search
    redirect_to episodes_path(:search => params[:search])
  end

  private
    def set_episode
      @episode = Episode.find(params[:id])
    end

    def episode_params
      params.require(:episode).permit(:name, :url, :last_season, :last_episode)
    end
end
