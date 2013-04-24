HumaniSe::Application.routes.draw do
  
  root to: 'site#index', as: :about
  
  get 'blog' => 'site#blog',  as: :blog
  
  namespace :admin do
    resources :admins
    resources :posts
    
    post 'login'  => 'admin#login',  as: :login
    get  'logout' => 'admin#logout', as: :logout
  end
end
