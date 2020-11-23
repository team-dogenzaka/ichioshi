source 'https://rubygems.org'

ruby '2.7.2'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'acts-as-taggable-on'
gem 'amazon-ecs'
gem 'carrierwave'
gem 'coffee-rails'
gem 'counter_culture'
gem 'devise'
gem 'dotenv-rails'
gem 'fog-aws'
gem 'font-awesome-rails'
gem 'google-analytics-rails'
gem 'gretel'
gem 'impressionist'
gem 'jbuilder'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'kaminari'
gem 'meta-tags'
gem 'mini_magick'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'pg'
gem 'puma'
gem 'rails'
gem 'rails_12factor'
gem 'sass-rails'
gem 'slack-notifier'
gem 'slim-rails'
gem 'turbolinks'
gem 'uglifier'

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'rspec_junit_formatter'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec'
  gem 'selenium-webdriver'
  gem 'slim_lint', require: false
end

group :development do
  gem 'bullet'
  gem 'html2slim'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
