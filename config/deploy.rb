set :ssh_options, { :forward_agent => true }

# Your cPanel/SSH login name
set :user, "votermed.railsplayground.net" # FOR VPS PRODUCTION
# set :user, "votermed" # FOR VPS STAGING
# set :user, "votermed" # FOR SHARED

# The domain name of the server to deploy to, this can be your domain or the domain of the server.
set :server_name, "votermedia.org" # FOR VPS PRODUCTION
# set :server_name, "voter.railsplayground.net" # FOR VPS STAGING
# set :server_name, "votermedia.railsplayground.net" # FOR SHARED

# If you are using git, uncomment the following line and comment out the line above.
set :scm, :git

# The name of your application, this will also be the folder were your application 
# will be deployed to
set :application, "gvmp"

# the url for your repository
set :repository, "git://git.assembla.com/gvmp.git"
set :branch, "rails3"

set :deploy_to, "/home/#{user}/apps/#{application}"
set :use_sudo, false
set :group_writable, false
default_run_options[:pty] = true 

role :app, server_name
role :web, server_name
role :db,  server_name, :primary => true

task :after_update_code, :roles => :app do
  db.symlink
#  deploy.install_gems
#  sphinx.symlink
#  sphinx.configure
end

namespace :deploy do

  desc "restart passenger"
  task :restart do
    passenger.restart
  end

  task :install_gems do
    run "cd #{release_path} && bundle install --deployment"
#    run "cd #{release_path} && bundle install --deployment && /opt/ruby-enterprise-1.8.7-2009.10/bin/bundle install --deployment"
  end

end

namespace :passenger do

  desc "Restart dispatchers"
  task :restart do
#    sphinx.restart
#    run "touch #{current_path}/tmp/restart.txt"
  end
end

namespace :db do

  task :symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config"
  end

end

