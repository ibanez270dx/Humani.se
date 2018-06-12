source "https://rubygems.org"

###########################################################
# Core
###########################################################

gem "rails", "~> 5.2"       # A full-stack web framework optimized for programmer happiness
gem "mysql2"                # A modern, simple, and very fast Mysql library
gem "puma"                  # A fast, threaded, and highly concurrent HTTP 1.1 server

###########################################################
# Assets
###########################################################

# Stylesheets
gem "sass-rails"            # Sass adapter for the Rails asset pipeline
gem "bourbon"               # A simple and lightweight mixin library for Sass
gem "font-awesome-sass"     # Scalable vector icons

# Javascript
gem "jquery-rails"          # Provides jQuery and jQuery-ujs libraries
gem "coffee-rails"          # CoffeeScript adapter for the Rails asset pipeline
gem "uglifier"              # Ruby wrapper for UglifyJS JavaScript compressor
gem "therubyracer"          # Embed the V8 Javascript Interpreter into Ruby
gem "turbolinks"            # Following links faster using AJAX

###########################################################
# Convenience
###########################################################

gem "bcrypt"                # Ruby bindings for OpenBSD's password hashing algorithm
gem "redcarpet"             # A fast, safe and extensible Markdown to (X)HTML parser
gem "bootsnap",             # Optimize and cache expensive computations at boot
  require: false

###########################################################
# Environments
###########################################################

group :test do
  gem "rspec-rails"               # BDD testing framework for Rails 3.x, 4.x and 5.0
  gem "shoulda-matchers"          # Collection of testing matchers extracted from Shoulda
  gem "factory_bot_rails"         # Fixtures as Ruby objects with a straightforward definition syntax
  gem "faker"                     # Library for generating fake data such as names, addresses, and phone numbers
  gem "database_cleaner"          # A set of strategies for cleaning your database in Ruby
  gem "rails-controller-testing"  # Brings back assigns to your controller tests
end

group :development, :test do
  gem "pry-rails"           # An IRB alternative and runtime developer console
  gem "spring"              # Keep running the app in the background
  gem "rubocop",            # Static code analyzer, based on the community Ruby style guide
    require: false
end

group :development do
  gem "web-console"         # Debugging in views with <% console %>
  gem "capistrano"          # Remote multi-server automation tool
  gem "capistrano-rails"    # Rails integration for Capistrano 3.x
  gem "capistrano-rbenv"    # Rbenv integration for Capistrano 3.x
  gem "capistrano-nginx"    # Nginx tasks for Capistrano
  gem "capistrano3-puma"    # Puma taks for Capistrano
end
