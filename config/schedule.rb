set :output, "/Users/bmalets/Documents/ror_projects/freelance/movieman/log/cron.log"
set :environment, "development"

every 3.hours do
  # scrape for fresh episodes on websites
  rake "scrape_for:fresh_episodes"
end
