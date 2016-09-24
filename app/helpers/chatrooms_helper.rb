module ChatroomsHelper
  def chatroom_lock_or_unlocked_path(chatroom)
    Chatroom.find(chatroom).is_private? ? chatroom_locked_path(chatroom) : chatroom_path(chatroom)
  end
end
