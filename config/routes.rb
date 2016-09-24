Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :chatrooms, except: [:edit, :update]
  resources :messages, only: :create
  get 'chatroom/:id' => 'chatrooms#show_locked', as: :chatroom_locked

  devise_for :users
  
  root 'chatrooms#index'
end
