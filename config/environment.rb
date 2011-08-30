# Load the rails application
require File.expand_path('../application', __FILE__)

# Quick fix for a bug -- see comment in https://github.com/indirect/jquery-rails/issues/56
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# Initialize the rails application
Gvmp::Application.initialize!
