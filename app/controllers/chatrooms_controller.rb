class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id].to_i)
    @message = Message.new
  end

  def create
  end

  def destroy
  end
end
