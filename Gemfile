source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
gem 'grape'
gem 'sidekiq'
gem 'sidekiq_mailer'
gem 'whenever', require: false
gem 'settingslogic'
gem 'mechanize'

gem 'haml-rails'
gem "therubyracer"
gem "less-rails"
gem "twitter-bootstrap-rails"
gem 'will_paginate-bootstrap'
gem 'will_paginate'
gem 'bootstrap_form'

gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-vkontakte'
gem 'font-awesome-rails'

group :production do
  gem 'pg'
end


group :development, :test do
  gem 'shoulda-matchers', require: false
  gem 'rspec', '2.14.1'
  gem 'rspec-rails', '2.14.1'
  gem 'pry'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano-sidekiq'
end

group :doc do
  gem 'fdoc'
  gem 'sdoc', '~> 0.4.0'
  gem 'railroady'
end
