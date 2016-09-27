class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :check_password, :show_with_password]

  respond_to :html
  respond_to :js, only: :check_password

  def index
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end

  def show
    @message = Message.new
  end

  def check_password
  end

  def show_with_password
    if @chatroom.authenticate(params[:password])
      session[:chatroom_access] = @chatroom.id
      redirect_to chatroom_path(@chatroom)
    else
      session[:chatroom_access] = nil
      redirect_to :back, flash: { alert: 'Incorrect password' }
    end
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.topic.gsub!(' ','_').downcase!
    @chatroom.user = current_user
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

  def set_chatroom
    @chatroom = Chatroom.find(params[:id].to_i)
  end

  def chatroom_params
    params.require(:chatroom).permit(:topic, :is_private, :password)
  end
end
