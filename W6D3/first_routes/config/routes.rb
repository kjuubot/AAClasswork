Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:create, :destroy, :index, :show, :update]
  resources :artworks, only:[:create, :destroy, :index, :show, :update]
  resources :artwork_shares, only:[:create, :destroy, :index, :show, :update]

#   get 'users/:id', to: 'users#show'
#   get 'users', to: 'users#index'
#   post 'users', to: 'users#create'
#   get 'users', to: 'users#new'
#   get 'users/:id', to: 'users#sedit'
#   patch 'users/:id', to: 'users#update'
#   put 'users/:id', to: 'users#update'
#   delete 'users/:id', to: 'users#destroy'
end
