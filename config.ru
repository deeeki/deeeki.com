# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

if ENV['RACK_ENV'] == 'production'
  require 'rack-rewrite'
  use Rack::Rewrite do
    r301 %r{.*}, 'http://deeeki.com$&', :if => Proc.new {|rack_env|
      rack_env['SERVER_NAME'] != 'deeeki.com'
    }
  end
end

run Website::Application
