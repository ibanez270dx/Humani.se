HumaniSe::Application.routes.draw do
  
  root to: 'site#index', as: :about
  
  get 'blog' => 'blog#index',  as: :blog
  get 'blog/:url_title' => 'blog#show', as: :blog_post
  
  namespace :admin do
    resources :admins
    resources :posts
    
    get  '/' => 'admins#login'
    post '/' => 'admins#login'
    get  'logout' => 'admins#logout', as: :logout
  end
end
