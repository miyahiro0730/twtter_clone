Rails.application.routes.draw do
  get 'sessions/new'

  resources :tweets do
    collection do
      post :confirm
    end
  end

  resources :favorites, only: [:create, :destroy]
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
