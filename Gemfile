source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.1.5'

gem 'rails-api'

gem 'spring', :group => :development

# Use postgresql as database
gem 'pg'

# To use ActiveModel has_secure_password
gem 'bcrypt', '3.1.7'

# Use unicorn as the app server
gem 'unicorn'
gem 'unicorn-rails'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

# Use JWT tokens for authentication
gem 'jwt'

# Enable cors requests
gem 'rack-cors', require: 'rack/cors'

# To build the JSON responses
gem 'active_model_serializers', github: 'rails-api/active_model_serializers', branch: '0-8-stable'

# Monitor usign New Relic
gem 'newrelic_rpm'
gem 'rails-api-newrelic'

group :development, :test do
  gem 'rspec-rails'
  gem 'meta_request'
end

group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem "codeclimate-test-reporter", require: nil
end
