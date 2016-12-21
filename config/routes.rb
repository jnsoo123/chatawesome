Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :chatrooms
  resources :messages, only: :create
  get 'chatroom/:id' => 'chatrooms#check_password', as: :chatroom_locked
  post 'chatroom/:id' => 'chatrooms#show_with_password', as: :check_chatroom_password
  get 'chatroom/:id/editpassword' => 'chatrooms#edit_password', as: :edit_chatroom_password
  put 'chatroom/:id/editpassword' => 'chatrooms#update_password', as: :update_chatroom_password
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'chatrooms#index'
end
