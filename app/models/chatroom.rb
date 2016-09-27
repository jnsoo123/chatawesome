class Chatroom < ApplicationRecord
  has_secure_password validations: false, if: :skip_password_validation
  
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages

  validates :topic, presence: true, uniqueness: true, case_sensitive: false
  
  def not_private(state)
    @not_private = true if state
  end
  
  private
  
  def skip_password_validation
    true if @not_private
  end
end
