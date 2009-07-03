# Your cPanel/SSH login name
set :user , "votermed"

# The domain name of the server to deploy to, this can be your domain or the domain of the server.
set :server_name, "votermedia.org"

# Your repository type, by default we use subversion. 
#set :scm, :subversion

# If you are using git, uncomment the following line and comment out the line above.
set :scm, :git

# The name of your application, this will also be the folder were your application 
# will be deployed to
set :application, "gvmp"

# the url for your repository
set :repository,  "git://git.assembla.com/gvmp.git"


###### There is no need to edit anything below this line ######
set :deploy_to, "/home/#{user}/apps/#{application}"
set :use_sudo, false
set :group_writable, false
default_run_options[:pty] = true 

role :app, server_name
role :web, server_name
role :db,  server_name, :primary => true

# set the proper permission of the public folder
task :after_update_code, :roles => [:web, :db, :app] do
  db.symlink
end

namespace :deploy do

  desc "restart passenger"
  task :restart do
    passenger.restart
  end

end

namespace :passenger do

  desc "Restart dispatchers"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

namespace :db do

  task :symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config"
#    run "ln -nfs #{shared_path}/config/production.sphinx.conf #{release_path}/config"
  end

end



