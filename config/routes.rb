Rails.application.routes.draw do
  # Not sure all of these will be necessary.
  root 'static_pages#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  post 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :tweets

  # Tweetbot
  get 'bot', to: 'tweets#bot'
  post 'tweetout', to: 'tweets#tweetout'

mount ResqueWeb::Engine => "/resque_web"


end