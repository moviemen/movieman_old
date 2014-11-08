# app/workers/hard_worker.rb
class NotificationWorker
  include Sidekiq::Worker

  def perform episode_id
    users = Episode.find(episode_id).users.pluck(:email)
    puts "Episode subscribers: #{users.to_s}"
  end
end