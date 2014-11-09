class NotificationWorker
  include Sidekiq::Worker
  
  sidekiq_options queue: 'notifications', retry: true

  def perform notification, episode_id
=begin
    Settings.notifications.each do |notification|
      "#{notification.capitalize}Service".constantize.notify episode_id
    end
  end
=end
end