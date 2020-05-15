Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions:      'users/sessions',
        passwords:     'users/passwords',
        registrations: 'users/registrations'
    }
    
  get 'home/top'
  root to: "home#top"
  get 'home/about'
  resources :users, only: [:show, :edit, :index, :update]
  

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  resources :books
end
