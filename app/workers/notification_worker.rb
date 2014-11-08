# app/workers/hard_worker.rb
class NotificationWorker
  include Sidekiq::Worker

  def perform message
    puts "Hi, I am a notification: #{message}"
  end
end