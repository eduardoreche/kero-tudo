KeroTudo::Application.routes.draw do
  
  get "dashboard/index"

  resources :celebrations

  resources :tags

  resources :products do 
    resources :pictures
  end

  resources :groups

  root :to => "home#index"
    
  devise_for :users

end
