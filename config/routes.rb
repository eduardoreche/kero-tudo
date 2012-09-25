KeroTudo::Application.routes.draw do
  
  resources :products do 
    resources :pictures
  end

  resources :tags

  resources :groups

  root :to => "home#index"
    
  devise_for :users

end
