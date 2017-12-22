source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.1'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'bootstrap-sass', '~> 3.3.6'
  gem 'bootstrap_form'
  gem 'byebug', platform: :mri
  gem 'carrierwave', '~> 1.0'
  gem 'cloudinary'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'devise'
  gem 'erb2haml'
  gem 'factory_bot_rails'
  gem 'figaro', '~> 1.1.1'
  gem 'haml'
  gem 'haml_lint', require: false
  gem 'json'
  gem 'listen', '~> 3.0.5'
  gem 'pg'
  gem 'pry'
  gem 'rails-controller-testing'
  gem 'rails-i18n', '~> 5.0.0' # For 5.0.x and 5.1.x
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-rspec'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'sprockets-rails', '~> 3.2.0'
  gem 'web-console', '>= 3.3.0'
end

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end
