Rails.application.routes.draw do
  resources :stories

  delete '/logout', to: 'sessions#destroy', as: :logout
  get '/auth/:provider/callback', to: 'sessions#create'

  root to: 'stories#index'
end
