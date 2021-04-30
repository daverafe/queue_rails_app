Rails.application.routes.draw do
  root 'application#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  resources :recommendations
  resources :users do 
    resources :recommendations, only: [:index, :new, :create]
  end
  resources :media_assets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
