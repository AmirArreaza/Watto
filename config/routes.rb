Watto::Application.routes.draw do
	root to: 'static_pages#home'
  	
  	resources :sessions, 	only: [:new, :create, :destroy]
  	resources :users, 		only: [:create, :edit, :update, :destroy]

  	match '/signup',  to: 'users#new'

end