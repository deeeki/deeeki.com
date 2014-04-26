# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

if Rails.env.production?
  use Rack::Rewrite do
    r301 %r{.*}, 'http://deeeki.com$&', if: ->(rack_env) { rack_env['SERVER_NAME'] != 'deeeki.com' }
  end
end

run Rails.application
