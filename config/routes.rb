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

    member do
        get :addbudget
        patch :description
    end
    post 'search',  :on => :collection

  end

  resources :users
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :followmarkets,       only: [:create, :destroy]

  # mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
      delete :empty_trash
    end
  end

end
