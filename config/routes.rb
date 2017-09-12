Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'         #page for a new session (login)
  post   '/login',   to: 'sessions#create'      #create a new session (login)
  delete '/logout',  to: 'sessions#destroy'     #delete a session (log out)
  get 	'search', to: 'static_pages#search'
  
  resources :users do
    resources :markets do
		resources :articles
	end
    member do
      get :following, :followers
	  get :followingmarkets
    end
  end

  resources :users
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :followmarkets,       only: [:create, :destroy]

end
