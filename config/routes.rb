HumaniSe::Application.routes.draw do
  
  root to: 'site#index', as: :about
  
  get 'blog' => 'site#blog',  as: :blog
  
  namespace :admin do
    resources :admins
    resources :posts
    
    get  '/' => 'admins#login'
    post '/' => 'admins#login'
    get  'logout' => 'admins#logout', as: :logout
  end
end
