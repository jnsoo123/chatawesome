class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end

  def show
    @chatroom = Chatroom.find(params[:id].to_i)
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to chatrooms_path
    else
      flash[:error] = @chatroom.errors.full_messages.join(',')
      render :new
    end
  end

  def destroy
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end
end
