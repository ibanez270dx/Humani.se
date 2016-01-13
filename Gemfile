source 'https://rubygems.org'

###########################################################
# Core
###########################################################

gem 'rails', '4.2.5'
gem 'mysql2'                # A modern, simple, and very fast Mysql library

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

# Authentication
gem 'bcrypt'                # Ruby bindings for OpenBSD's password hashing algorithm

# Markdown
gem 'redcarpet'             # A fast, safe and extensible Markdown to (X)HTML parser

# Syntax Highlighting
gem 'pygmentize'            # A standalone Pygments for Ruby

###########################################################
# Environments
###########################################################

group :production do
  gem 'unicorn'             # HTTP Server for Rack apps
end

group :development do
  gem 'capistrano',        '~> 3.4.0'   # Remote multi-server automation tool
  gem 'capistrano-rails',  '~> 1.1'     # Rails integration for Capistrano 3.x
  gem 'capistrano-rbenv',  '~> 2.0'     # rbenv integration for Capistrano 3.x
  gem 'quiet_assets'                    # Mute asset pipeline log messages
end

group :development, :test do
  gem 'byebug'                  # A simple to use, feature rich debugger
  gem 'web-console', '~> 2.0'   # Debugging in views with <% console %>
  gem 'spring'                  # Keep running the app in the background
end
