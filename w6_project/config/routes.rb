Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :users


  # get '/users', to: 'users#index'
  # post '/users', to: 'users#create'
  # get '/users/new', to: 'users#new'
  # get '/users/:id', to: 'users#show'
  # get '/users/:id/edit', to: 'users#edit'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

  
  resources :users, only: [:create, :destroy, :index, :show, :update]
  
  get '/users/:user_id/artworks', to: 'artworks#index'
  resources :artworks, only: [:create, :destroy, :index, :show, :update]
  
  resources :artwork_shares, only: [:create, :destroy]

  get '/users/:user_id/comments', to: 'comments#index'
  get '/artworks/:artwork_id/comments', to: 'comments#index'
  resources :comments, only: [:index, :create, :destroy]


end
