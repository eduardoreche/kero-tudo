source 'https://rubygems.org'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'


# Gems used only for assets and not required
# in production environments by default.
group :assets do  
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'less-rails'
  
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  
  gem 'chosen-rails'
  
  gem "asset_sync"
  gem "compass"
  gem "compass-rails"
end

gem 'twitter-bootstrap-rails', '2.2.1'

gem 'jquery-rails', '2.1.4' #jquery 1.8.3 version
gem 'devise'
gem 'simple_form'
gem "paperclip", "~> 3.0"
gem 'friendly_id'

gem "json", "1.7.7" #security update
gem "kaminari"

gem 'newrelic_rpm'

# Test Gems
gem 'rspec-rails', :group => [:test, :development]
# group :test do
#   gem "factory_girl_rails"
#   gem "capybara"
#   gem "capybara-webkit"
#   gem "guard-rspec"
#   gem 'launchy'  
#   gem "database_cleaner"
# end

#production
group :production, :staging do
  gem 'unicorn'
  gem 'activerecord-postgresql-adapter'
  gem 'aws-sdk'
end
