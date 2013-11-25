source 'https://rubygems.org'

#################################################
# Core
#################################################

gem 'rails'
gem 'mysql2'
gem 'jquery-rails'

group :assets do
  gem 'sass-rails'
  gem 'bourbon'
  gem 'neat'
  gem 'font-awesome-sass'
  gem 'coffee-rails'
  gem 'therubyracer'
  gem 'uglifier'
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

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Markdown
gem 'redcarpet'

# Syntax Highlighting
gem 'pygmentize'
