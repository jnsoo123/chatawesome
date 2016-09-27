class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :read, :all
      can :destroy, Chatroom, user_id: user.id
      can :update, Chatroom, user_id: user.id
      can :create, Chatroom
    end
  end
end
