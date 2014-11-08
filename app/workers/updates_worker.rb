# UpdatesWorker.perform_async
class UpdatesWorker
  include Sidekiq::Worker
  
  sidekiq_options queue: 'updates', retry: true

  def perform
    Settings.strategies.each do |strategy|
      time = Benchmark.measure do
        "#{strategy.capitalize}Strategy".constantize.new.check_for_updates
      end
      puts time
    end
  end
end