source 'https://rubygems.org'
ruby '2.1.2'

gem 'dotenv-rails', groups: [:development, :test]

gem 'rails', '4.1.7'
gem 'pg'
gem 'unicorn'
gem 'quiet_assets'
gem 'typhoeus'
gem 'rack-cors', require: 'rack/cors'
gem 'newrelic_rpm'
gem 'delayed_job_active_record'
gem 'jbuilder', '~> 2.0'
gem 'heroku'

group :development do
  gem 'lol_dba'
  gem 'bullet'
  gem 'rails_best_practices'
end

group :development, :test do
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'byebug'
  gem 'rspec-rails'
end

group :test do
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'vcr'
  gem 'webmock'
end

group :production do
  gem 'rails_12factor'
  gem 'workless'
end
