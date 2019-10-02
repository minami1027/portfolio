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
  #get 'users/show'
  #get 'users/edit', to: 'users#edit'
  get 'users/:id/remove/', to: 'users#remove', as: 'user_remove'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ###ルートURL
  root 'items#index'
end