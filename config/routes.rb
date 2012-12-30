KeroTudo::Application.routes.draw do
  
  resources :celebrations do
    resources :highlights
  end

  resources :tags

  resources :products do 
    resources :pictures
  end

  resources :groups

  root :to => "admin#index"
  
  match  "admin" => "admin#index"
    
  devise_for :users

end
