# app/workers/hard_worker.rb
class NotificationWorker
  include Sidekiq::Worker

  def perform episode_id
    Settings.notifications.each do |notification|
      "#{notification.capitalize}Service".constantize.notify episode_id
    end
  end
end