Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  delete 'users/delete/:id', to: 'users#destroy', as: 'users/destroy'
  get '/', to: 'homes#index', as: 'root'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', :registrations => "users/registrations" }
  resources :users, only: [:index, :show], as: 'users'
  get '/reviews', to: 'reviews#index'
  resources :favorites, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :hashtags
  
  resources :reviews do
    resources :comments
  end
  
  resources :reviewtags
  
  resources :items do
    patch 'update_tags', on: :member
  end

  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

end
