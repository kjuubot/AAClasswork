Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show] do
    resources :subs, only: [:create]
    resources :posts, only: [:create]
  end

  resource :session, only: [:new, :create, :destroy]

  resources :subs, except: [:create, :destroy] do
    resources :posts, only: [:new]
  end

  resources :posts, except: [:create, :new, :index]
end