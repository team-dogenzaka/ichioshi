Rails.application.routes.draw do
  get '/reviews', to: 'reviews#index'
  resources :reviews
end
