Watto::Application.routes.draw do

  resources :users, only: [:new, :create, :edit, :update, :destroy]

end
