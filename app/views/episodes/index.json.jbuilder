json.array!(@episodes) do |episode|
  json.extract! episode, :id, :name, :url, :last_season, :last_episode
  json.url episode_url(episode, format: :json)
end
