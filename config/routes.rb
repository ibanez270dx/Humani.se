HumaniSe::Application.routes.draw do

  root to: 'site#about', as: :about

  get 'blog' => 'blog#index',  as: :blog
  get 'blog/:slug' => 'blog#show', as: :blog_post

  # Add channel for Facebook plugin performance
  # https://developers.facebook.com/blog/post/2011/08/02/how-to--optimize-social-plugin-performance/
  get 'channel' => 'site#channel', as: :facebook_channel

  namespace :admin do
    resources :admins
    resources :posts

    match '/' => 'admins#login', as: :login, via: [ :get, :post ]
    get  'logout' => 'admins#logout', as: :logout
  end
end
