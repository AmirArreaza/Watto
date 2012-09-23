Watto::Application.routes.draw do
  root to: 'static_pages#home'

  resources :sessions, 	only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :companies, only: [:show, :new, :create, :edit, :update, :destroy]

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

end
