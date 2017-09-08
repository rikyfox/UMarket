Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'         #page for a new session (login)
  post   '/login',   to: 'sessions#create'      #create a new session (login)
  delete '/logout',  to: 'sessions#destroy'     #delete a session (log out)
  
  resources :users do
    resources :markets				
    member do
      get :following, :followers
    end
  end

  resources :users
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]


end
