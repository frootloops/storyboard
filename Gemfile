source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '~> 3.2.8'
gem 'pg'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'thin'
gem 'high_voltage'
gem 'paperclip'
gem 'formtastic'
gem 'flutie'
gem 'bourbon'
gem 'airbrake'
gem 'devise'
gem 'versionist'
gem 'strong_parameters'
gem 'active_model_serializers', github: 'rails-api/active_model_serializers'

group :development do
  gem 'foreman'
end

group :development, :test do
  gem 'guard'
  gem 'guard-spork'
  gem 'rspec-rails'
  gem 'sham_rack'
  gem 'forgery'
  gem 'factory_girl_rails'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'bourne'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'shoulda-matchers'
  gem 'launchy'
  gem 'simplecov', require: false
  gem 'json_spec'
end

group :staging, :production do
  gem 'newrelic_rpm'
end
