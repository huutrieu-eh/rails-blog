set :output, "log/cron.log"
set :environment, "development"

every 1.day, at: '17:30 pm' do
  rake "article:notify_new_article"
end

