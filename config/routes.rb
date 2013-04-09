KeroTudo::Application.routes.draw do
  
  get "gifts/index"
  get "gifts/filter"

  get "contacts/index"
  get "contacts/mail"

  get "home/index"

  resources :celebrations do
    resources :highlights
  end

  resources :tags

  resources :products do 
    resources :pictures
  end

  resources :groups

  root :to => "home#index"
  
  match  "admin" => "admin#index"
    
  devise_for :users
  match 'user_root' => 'admin#index'

end
