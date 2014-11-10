source 'https://rubygems.org'

#################################################
# Core
#################################################

gem 'rails', '4.1.7'
gem 'mysql2'
gem 'jquery-rails'

group :assets do
  gem 'sass-rails'
  gem 'bourbon'
  gem 'neat'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'therubyracer'
end

group :production do
  # App server
  gem 'unicorn'
end

group :development do
  # Use debugger
  gem 'debugger'

  # Better Errors
  gem 'better_errors'
  gem 'binding_of_caller'

  # App Server
  gem 'thin'

  # Quiet Assets
  gem 'quiet_assets'
end

#################################################
# Convenience
#################################################

# Speed things up
gem 'turbolinks'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby'

# Markdown
gem 'redcarpet'

# Syntax Highlighting
gem 'pygmentize'
