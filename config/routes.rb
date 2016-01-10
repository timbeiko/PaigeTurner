require "resque_web"

Rails.application.routes.draw do
  # Not sure all of these will be necessary.
  root 'static_pages#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  post 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :tweets
  resources :books
  get '/login', to: 'sessions#new'
  get 'auth/identity/', to: redirect('/login')
  resources :identities, only: [:new, :create]

  resources :tweets do
  	get :autocomplete_book_title, on: :collection
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Users
  resources :users, only: :show

  # Tweetbot
  get 'bot', to: 'tweets#bot'
  post 'tweetout', to: 'tweets#tweetout'

  # Mounts the resque web console
  mount ResqueWeb::Engine => "/resque_web"

end
