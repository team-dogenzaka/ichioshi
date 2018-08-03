Rails.application.routes.draw do
  get '/reviews', to: 'reviews#index'
  resources :reviews do
    collection do
      post :confirm
    end
  end
end
