Rails.application.routes.draw do
  root to: "site#about", as: :about

  get "blog", to: "blog#index",  as: :blog
  get "blog/:slug", to: "blog#show", as: :blog_post

  # Add channel for Facebook plugin performance
  # https://developers.facebook.com/blog/post/2011/08/02/how-to--optimize-social-plugin-performance/
  get "channel", to: "site#channel", as: :facebook_channel

  namespace :admin do
    root to: "posts#index"

    resources :admins
    resources :posts

    match "/", to: "base#login", as: :login, via: [:get, :post]
    get "logout", to: "base#logout", as: :logout
  end
end
