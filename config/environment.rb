RAILS_GEM_VERSION = '2.3.2'  unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.gem 'mislav-will_paginate', :version => '~> 2.3.8', :lib => 'will_paginate', 
    :source => 'http://gems.github.com'

  config.gem 'haml', :version => '= 2.0.9'

  # Make Time.zone default to the specified zone, and make Active Record store time values
  # in the database in UTC, and return them converted to the specified local zone.
  # Run "rake -D time" for a list of tasks for finding time zone names. Uncomment to use default local time.
  config.time_zone = 'UTC'

  # Your secret key for verifying cookie session data integrity.
  # If you change this key, all old sessions will become invalid!
  # Make sure the secret is at least 30 characters and all random, 
  # no regular words or you'll be exposed to dictionary attacks.
  config.action_controller.session = {
    :session_key => '_untitled-f2dae1_session',
    :secret      => '45520b142a01261a75f398282100232ad216dfd246085dc622767a4432b0c5ba238d8b81c3d5237fbd314563c573c8d45794573325f156ad0b299eb6910ed4ea'
  }

  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with "rake db:sessions:create")
  # config.action_controller.session_store = :active_record_store
end
