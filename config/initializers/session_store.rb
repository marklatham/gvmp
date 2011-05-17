# Be sure to restart your server when you modify this file.

# Was getting error ActionDispatch::Cookies::CookieOverflow so advice from
# blog.anands.net/2010/06/30/migrating-a-rails-app-from-rails-2-3-8-to-rails-3-0-0-beta-4/ :

# Gvmp::Application.config.session_store :cookie_store, :key => '_gvmp_session'
Rails.application.config.session_store :active_record_store, :key => '_gvmp_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Gvmp::Application.config.session_store :active_record_store
