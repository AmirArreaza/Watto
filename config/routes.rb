Watto::Application.routes.draw do
  root to: 'static_pages#home'

  resources :sessions, 	only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :addresses, only: [:new, :create, :show]
  	match 'addresses/update_state_select/:id', to: 'addresses#update_state_select'
  	match 'addresses/update_city_select/:id', to: 'addresses#update_city_select'
  	match "addresses/update_versions/:id" => "addresses#update_versions"


  resources :companies, only: [:show, :new, :create, :edit, :update, :destroy]

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

end
