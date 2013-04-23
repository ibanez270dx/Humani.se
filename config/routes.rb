HumaniSe::Application.routes.draw do
  
  root :to => 'site#index', as: :about
  get 'blog' => 'blog#index', as: :blog
end
