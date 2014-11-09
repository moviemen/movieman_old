class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @episodes = params[:search] ? Episode.where(name: params[:search]) : current_user.episodes.order('id ASC')
    @episodes =@episodes.paginate(:page => params[:page],per_page: 15)

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
<<<<<<< HEAD
    current_user.episodes << @episode
=======
    current_user.episodes << @episodes
>>>>>>> 561e4f84b8b27a525a6adf52cf20a0a620ad5a35
    flash[:notice] = "You have subscribed to the #{@episode.name} serial"
    redirect_to episodes_path
  end

  def unsubscribe
    current_user.episodes.delete @episode
    flash[:notice] = "You have unsubscribed to the #{@episode.name} serial"
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
