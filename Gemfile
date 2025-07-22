# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bootsnap', require: false
gem 'devise-jwt'
gem 'pg'
gem 'puma'
gem 'rails'

gem 'tzinfo-data', platforms: [:mswin, :mingw, :x64_mingw]

group :development, :test do
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'codecov'
  gem 'database_cleaner'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'shoulda-matchers'
end

group :test do
  gem 'simplecov', require: false
end
