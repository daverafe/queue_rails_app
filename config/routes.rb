Rails.application.routes.draw do
  root 'application#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  resources :users do 
    resources :recommendations
  end
  resources :media_assets
  resources :recommendations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
