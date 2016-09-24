class ChatroomsController < ApplicationController

  respond_to :html
  respond_to :js, only: :show_locked

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

  def show_locked
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      ActionCable.server.broadcast 'chatgroups',
        channel: @chatroom.topic,
        id: @chatroom.id,
        user_count: @chatroom.users.uniq.count
      redirect_to root_path
    else
      flash[:error] = @chatroom.errors.full_messages.join(',')
      render :new
    end
  end

  def destroy
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:topic, :is_private)
  end
end
