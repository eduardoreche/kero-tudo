KeroTudo::Application.routes.draw do
  
  resources :products

  resources :tags

  resources :groups

  root :to => "home#index"
    
  devise_for :users

end
