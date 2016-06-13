source 'https://rubygems.org'

###########################################################
# Core
###########################################################

gem 'rails', '5.0.0.rc1'
gem 'mysql2'                # A modern, simple, and very fast Mysql library
gem 'puma'                  # A fast, threaded, and highly concurrent HTTP 1.1 server

###########################################################
# Assets
###########################################################

# Stylesheets
gem 'sass-rails'            # Sass adapter for the Rails asset pipeline
gem 'bourbon'               # A simple and lightweight mixin library for Sass
gem 'neat'                  # A lightweight, semantic grid framework using Bourbon

# Javascript
gem 'jquery-rails'          # Provides jQuery and jQuery-ujs libraries
gem 'coffee-rails'          # CoffeeScript adapter for the Rails asset pipeline
gem 'uglifier'              # Ruby wrapper for UglifyJS JavaScript compressor
gem 'therubyracer'          # Embed the V8 Javascript Interpreter into Ruby
gem 'turbolinks'            # Following links faster using AJAX

###########################################################
# Miscellaneous
###########################################################

gem 'bcrypt'                # Ruby bindings for OpenBSD's password hashing algorithm
gem 'redcarpet'             # A fast, safe and extensible Markdown to (X)HTML parser
gem 'pygmentize'            # A standalone Pygments for Ruby

###########################################################
# Environments
###########################################################

group :development, :test do
  gem 'pry-rails'               # An IRB alternative and runtime developer console
  gem 'web-console', '~> 2.0'   # Debugging in views with <% console %>
  gem 'spring'                  # Keep running the app in the background
end

group :development do
  gem 'capistrano'          # Remote multi-server automation tool
  gem 'capistrano-rails'    # Rails integration for Capistrano 3.x
  gem 'capistrano-rbenv'    # Rbenv integration for Capistrano 3.x
  gem 'capistrano-nginx'    # Nginx tasks for Capistrano
  gem 'capistrano3-puma'    # Puma taks for Capistrano
  gem 'quiet_assets'        # Mute asset pipeline log messages
end
