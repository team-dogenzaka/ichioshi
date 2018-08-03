Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/reviews', to: 'reviews#index'
  resources :reviews do
    collection do
      post :confirm
    end
  end
end
