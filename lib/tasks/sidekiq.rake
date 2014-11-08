require 'mechanize'

namespace :sidekiq do

  desc "reset notification queue"
  task reset_notifications_queue: :environment do
    Sidekiq::Queue.new('notifications').clear
    Sidekiq::RetrySet.new.clear
    Sidekiq::ScheduledSet.new.clear  
  end

  desc "reset updates queue"
  task reset_updates_queue: :environment do
    Sidekiq::Queue.new('updates').clear
    Sidekiq::RetrySet.new.clear
    Sidekiq::ScheduledSet.new.clear  
  end
    
end