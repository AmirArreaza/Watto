Watto::Application.routes.draw do
  get "blacklists/new"

	root to: 'static_pages#home'
  	
  	resources :sessions, 	only: [:new, :create, :destroy]
  	resources :users, only: [:new, :create, :show]

  	match '/signup',  to: 'users#new'
  	match '/signin',  to: 'sessions#new'
  	match '/signout', to: 'sessions#destroy', via: :delete

end