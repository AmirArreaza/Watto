Watto::Application.routes.draw do
  resources :sessions, 	only: [:new, :create, :destroy]
  resources :users, 	only: [:new, :create, :show]
  resources :addresses, only: [:new, :create, :show, :edit, :update]
  	match "addresses/update_cities/:id" => "addresses#update_cities"
  	match "addresses/update_states/:id" => "addresses#update_states"
  resources :companies, 	only: [:show, :new, :create, :edit, :update, :destroy]
  resources :products, 		only: [:show, :new, :create, :edit, :update, :destroy]
  resources :reservations, 	only: [:new, :create, :show, :edit, :update, :destroy]

  root to: 'users#new'

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

end
