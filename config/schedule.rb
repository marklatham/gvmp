# Use this file to easily define all of your cron jobs.
#

set :output, "./log/cron_log.log"
set :environment, 'development'
#

  every 5.minutes do
    rake   %q{-s  feed:load}
  end

#   every :saturday, :at => '4:02am' do
#       rake  %q{-s   db:migrate:reset    db:fixtures:load    feed:fix}
#   end

# Learn more: http://github.com/javan/whenever
