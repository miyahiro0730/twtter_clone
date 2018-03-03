Rails.application.routes.draw do
  resources :feeds
  resources :contacts
  get 'sessions/new'

  resources :tweets do
    collection do
      post :confirm
    end
  end

  resources :favorites, only: [:create, :destroy]
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
