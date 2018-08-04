Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  delete 'users/:id', to: 'users#destroy'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, :only => [:index, :show]
  get '/reviews', to: 'reviews#index'
  resources :favorites, only: [:create, :destroy]
  resources :reviews do
    collection do
      post :confirm
    end
  end
end
