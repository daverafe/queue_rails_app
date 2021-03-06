Rails.application.routes.draw do
  root 'application#welcome'
  get '/home', to: 'application#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  resources :recommendations
  resources :users do 
    resources :recommendations, only: [:index, :new, :create]
  end
  resources :media_assets do
    resources :recommendations, only:[:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
