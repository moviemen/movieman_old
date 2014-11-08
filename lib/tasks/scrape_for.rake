require 'mechanize'

namespace :scrape_for do

  desc "parse episodes into database"
  task fresh_episodes: :environment do
    #UpdatesWorker.perform_async
    time = Benchmark.measure do
      FsStrategy.new.check_for_updates
    end
    puts time
  end

  desc "parse episodes into database"
  task reset: :environment do
    Sidekiq::Queue.new('notifications').clear
    Sidekiq::RetrySet.new.clear
    Sidekiq::ScheduledSet.new.clear  
  end
end