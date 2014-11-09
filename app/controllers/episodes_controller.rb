class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @episodes = params[:search] ? Episode.where(name: params[:search]) : current_user.episodes.order('id ASC')
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
    @episode.destroy
    redirect_to episodes_path
  end

  def search
    redirect_to episodes_path(:search => params[:search])
  end

  def subscribe
    @episode = Episode.find(params[:episode_id])
    current_user.episodes << @episode
    flash[:notice] = "You have subscribed to the #{@episode.name} serial"
    redirect_to episodes_path
  end

  def unsubscribe
    @episode = Episode.find(params[:episode_id])
    current_user.episodes.delete @episode
    flash[:notice] = "You have unsubscribed from the #{@episode.name} serial"
    redirect_to episodes_path
  end

  private
    def set_episode
      @episode = Episode.find(params[:id])
    end

    def episode_params
      params.require(:episode).permit(:name, :url, :last_season, :last_episode)
    end
end
