Rails.application.routes.draw do
  get 'sessions/new'

  resources :tweets do
    collection do
      post :confirm
    end
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
