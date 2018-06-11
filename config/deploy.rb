# config valid only for current version of Capistrano
lock "3.11.0"

# Name and Repo
set :application, "humanise"
set :repo_url, "git@github.com:ibanez270dx/humani.se.git"
set :branch, "master"

# Nginx
set :nginx_server_name, "humani.se"
set :nginx_redirect_from_www, true

# SSL
set :nginx_use_ssl, true
set :nginx_ssl_certificate, "/etc/letsencrypt/live/humani.se/fullchain.pem"
set :nginx_ssl_certificate_key, "/etc/letsencrypt/live/humani.se/privkey.pem"

# App Location
set :user, "deploy"
set :deploy_to, "/home/#{fetch(:user)}/humani.se"

# Default value for :pty (pseudo terminal) is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push("config/database.yml", "config/secrets.yml")

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push("log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system")

# Rbenv
set :rbenv_type, :user
set :rbenv_ruby, File.read(".ruby-version").strip

# Puma
set :puma_init_active_record, true

# Update config and bounce NGINX
after "puma:restart", "puma:nginx_config"
after "puma:nginx_config", "nginx:restart"
