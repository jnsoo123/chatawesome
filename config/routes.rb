Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :chatrooms, except: [:edit, :update]
  resources :messages, only: :create

  devise_for :users
  
  root 'chatrooms#index'
end
