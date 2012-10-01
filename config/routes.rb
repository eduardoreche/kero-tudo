KeroTudo::Application.routes.draw do
  
  resources :tags

  resources :products do 
    resources :pictures
  end

  resources :groups

  root :to => "home#index"
    
  devise_for :users

end
