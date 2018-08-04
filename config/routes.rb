Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, :only => [:index, :show]
  get '/reviews', to: 'reviews#index'
  resources :reviews do
    collection do
      post :confirm
    end
  end
end
