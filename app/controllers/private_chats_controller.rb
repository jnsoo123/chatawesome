class PrivateChatsController < ApplicationController
  def show
    @recipient = User.find(params[:id])

    if @chatroom = PrivateChat.where(user_one: current_user).presence
      @chatroom = @chatroom.where(user_two: @recipient).first
    elsif @chatroom = PrivateChat.where(user_two: current_user).presence
      @chatroom = @chatroom.where(user_one: @recipient).first
    else 
      @chatroom = PrivateChat.create(user_one: current_user, user_two: @recipient)
    end
    
    @message = Message.new

    render 'chatrooms/show'
  end

  def create
  end
end
