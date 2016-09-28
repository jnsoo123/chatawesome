class Chatroom < ApplicationRecord
  has_secure_password validations: false, if: :skip_password_validation
  has_secure_password validations: true, on: :update_password
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages

  belongs_to :user

  validates :topic, presence: true, uniqueness: true, case_sensitive: false
  validates :password, length: { minimum: 6 }, unless: :skip_password_validation, on: :create


  def not_private(state)
    @not_private = true if state
  end

  private

  def skip_password_validation
    true if @not_private
  end
end
