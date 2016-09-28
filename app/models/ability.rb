class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :read, :all
      can :destroy, Chatroom, user_id: user.id
      can :update, Chatroom, user_id: user.id
      can :edit_password, Chatroom, user_id: user.id
      can :update_password, Chatroom, user_id: user.id
      can :check_password, Chatroom
      can :show_with_password, Chatroom
      can :create, Chatroom
    end
  end
end
