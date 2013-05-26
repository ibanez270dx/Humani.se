source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc1'
gem 'mysql2'
gem 'jquery-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do

  gem 'sass-rails',   '~> 4.0.0.rc1'
  gem 'coffee-rails', '~> 4.0.0.rc1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', platforms: :ruby

  gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
  gem 'uglifier', '>= 1.0.3'

end

group :production do
  # App server
  gem 'unicorn'
end

group :development do
  # Use debugger
  gem 'debugger'

  # Pry
  gem 'pry-rails'
  gem 'pry-plus'

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

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Restore standard onReady events while still using Turbolinks
# gem 'jquery-turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 1.0.1'

# Deploy with Capistrano
# gem 'capistrano', group: :development

