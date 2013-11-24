HumaniSe::Application.routes.draw do

  root to: 'site#about', as: :about

  get 'blog' => 'blog#index',  as: :blog
  get 'blog/:url_title' => 'blog#show', as: :blog_post

  namespace :admin do
    resources :admins
    resources :posts

    match '/' => 'admins#login', as: :login, via: [ :get, :post ]
    get  'logout' => 'admins#logout', as: :logout
  end
end
