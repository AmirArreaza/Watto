Watto::Application.routes.draw do
  resources :sessions, 	only: [:new, :create, :destroy]
  resources :users, 	only: [:new, :create, :show]
  resources :addresses, only: [:new, :create, :show, :edit, :update]
  	match "addresses/update_cities/:id" => "addresses#update_cities"
  	match "addresses/update_states/:id" => "addresses#update_states"
  resources :companies, 		only: [:show, :new, :create, :edit, :update, :destroy]
  resources :products, 			only: [:show, :new, :create, :edit, :update, :destroy]
  resources :reservations, 		only: [:show, :new, :create, :edit, :update, :destroy]
  resources :phones,			only: [:show, :new, :create, :edit, :update, :destroy]
  	match "phones/new/:id" => "phones#new"
  resources :promotions,		only: [:show, :new, :create, :edit, :update, :destroy]
  resources :promotion_types,	only: [:show, :new, :create, :edit, :update, :destroy]
  resources :departments, 		only: [:show, :new, :create, :edit, :update, :destroy]
  resources :subdepartments, 	only: [:show, :new, :create, :edit, :update, :destroy]

  root to: 'users#new'

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

end
