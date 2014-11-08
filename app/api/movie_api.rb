module MovieApi
  class API < Grape::API
    format :json
    content_type :json, 'application/json; charset=utf-8'

    get 'episodes' do
    	{
    		episodes: User.find(env['rack.session'][:user_id]).episodes.map do |episode|
    			{
    				id: episode.id,
    				name: episode.name,
    				url: episode.url,
    				last_season: episode.last_season,
    				last_episode: episode.last_episode
    			}
    		end
    	}
    end

    post 'episodes' do
    	User.find(env['rack.session'][:user_id]).episodes << Episode.create(name: params[:name], url: params[:url])
    end

    delete 'episodes/:id' do
    	User.find(env['rack.session'][:user_id]).episodes.delete(params[:id])
    end
  end
end