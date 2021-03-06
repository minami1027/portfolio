Rails.application.routes.draw do
  ###Devise
  #Users::~~DeviseController
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    registrations: 'users/registrations'
  }


  # #Administrators::~~DeviseController
  devise_for :administrators, controllers: {
    sessions:      'administrators/sessions',
    registrations: 'administrators/registrations'
  }

  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy', as: :logout
  end

  #ReviewController
  # resources :reviews, only: [:index, :edit, :update, :destroy ,:new ,:create]
  resources :reviews, only: [:index, :edit, :update, :destroy, :new, :create]
  #delete '/reviews/:review_id',to: 'reviews#destroy', as: 'hogeo'


  #get 'users/show'
  #get 'users/edit', to: 'users#edit'
  get 'users/:id/remove/', to: 'users#remove', as: 'user_remove'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ###ルートURL
  root 'items#index'
  ###エンドユーザー###
  #UsersController
  resources :users, only: [:show, :edit, :update] do
    collection do
      get 'warn'
      patch 'unsubscribe'
    end
   end

  #ItemsController
  resources :items, only: :show
  get '/items/category/:category_id', to: 'items#category', as: :category

  #FavoritesController
  resources :favorites, only: [:index, :create, :destroy]


  ###管理者###
  #Admin::UsersController
  get '/admin', to: 'admin/users#top' #管理者側のルートURL

  #Admin::End_UsersController
  namespace :admin do
    resources :end_users, only: [:index, :show, :edit, :update]
    patch '/end_users/remove/:id', to: 'end_users#remove', as: :remove ##設計と違う箇所
  end

  #Admin::ItemsController
  namespace :admin do
    resources :items, only: [:index, :show, :edit, :update, :new, :create]
    put 'items/stop/:id', to: 'items#stop', as: :stop
    get'items/category/:category_id',to: 'items#category', as: :category
  end
end