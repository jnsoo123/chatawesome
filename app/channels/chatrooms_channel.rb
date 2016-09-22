class ChatroomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chatgroups'
  end
end
