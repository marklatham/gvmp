set :ssh_options, { :forward_agent => true }

# Your cPanel/SSH login name
set :user , "votermed"

# The domain name of the server to deploy to, this can be your domain or the domain of the server.
set :server_name, "votermedia.org"

# If you are using git, uncomment the following line and comment out the line above.
set :scm, :git

# The name of your application, this will also be the folder were your application 
# will be deployed to
set :application, "gvmp"

# the url for your repository
set :repository,  "git://git.assembla.com/gvmp.git"
set :branch, 'master'

set :deploy_to, "/home/#{user}/apps/#{application}"
set :use_sudo, false
set :group_writable, false
default_run_options[:pty] = true 

role :app, server_name
role :web, server_name
role :db,  server_name, :primary => true

task :after_update_code, :roles => :app do
  db.symlink
  deploy.rebuild_gems
  sphinx.symlink 
  sphinx.configure
end

namespace :deploy do

  desc "restart passenger"
  task :restart do
    passenger.restart
  end

  task :rebuild_gems do
    run "rake -f #{release_path}/Rakefile gems:build RAILS_ENV=production"
  end

end

namespace :passenger do

  desc "Restart dispatchers"
  task :restart do
    sphinx.restart
    run "touch #{current_path}/tmp/restart.txt"
  end
end

namespace :db do

  task :symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config"
  end

end

namespace :sphinx do 
  task :symlink, :roles => :app do
    run "ln -nfs #{shared_path}/config/sphinx.yml #{release_path}/config"
    run "ln -nfs #{shared_path}/db/sphinx #{release_path}/db/"
  end

  task :configure, :roles => :app do
    run "cd #{release_path} && rake thinking_sphinx:configure RAILS_ENV=production"
  end

  task :start, :roles => :app do
    run "cd #{current_path} && rake thinking_sphinx:start RAILS_ENV=production"
  end

  task :stop , :roles => :app do
    run "cd #{current_path} && rake thinking_sphinx:stop RAILS_ENV=production"
  end

  task :restart, :roles => :app do
    stop
    start
  end

end



