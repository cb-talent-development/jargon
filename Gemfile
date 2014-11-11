source 'https://rubygems.org'

gem 'rails', '~> 4.1.6'
gem 'pg'
gem 'active_model_serializers'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Front End
gem 'jquery-rails'
gem 'foundation-rails', '~> 5.4.5'
gem 'haml', '~> 4.0.5'

# Auth
gem 'doorkeeper', '~> 1.4.0'
gem 'devise', '~> 3.3.0'

group :development do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'spring'
end

group :test, :development do
  gem 'factory_girl_rails', '~> 4.4.1'
  gem 'database_cleaner', '~> 1.2.0'
end

group :test do
  gem "codeclimate-test-reporter", require: nil
  gem 'rspec_active_model_serializers'
end
