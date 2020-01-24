Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:create, :destroy, :index, :show, :update] do
    resources :artworks, only:[:index]
  end

  resources :artworks, only:[:create, :destroy, :show, :update] do
    post 'favorite', on: :member
  end

  resources :artwork_shares, only:[:create, :destroy] do
    post 'favorite', on: :member
  end

  resources :comments, only:[:create, :destroy, :index]

#   get 'users/:id', to: 'users#show'
#   get 'users', to: 'users#index'
#   post 'users', to: 'users#create'
#   get 'users', to: 'users#new'
#   get 'users/:id', to: 'users#sedit'
#   patch 'users/:id', to: 'users#update'
#   put 'users/:id', to: 'users#update'
#   delete 'users/:id', to: 'users#destroy'
end
