Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :chatrooms, except: [:edit, :update]
  resources :messages, only: :create
  get 'chatroom/:id' => 'chatrooms#check_password', as: :chatroom_locked
  post 'chatroom/:id' => 'chatrooms#show_with_password', as: :check_chatroom_password
  devise_for :users

  root 'chatrooms#index'
end
