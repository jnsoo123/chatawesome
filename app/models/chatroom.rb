class Chatroom < ApplicationRecord
  has_secure_password validations: false
  # has_secure_password validations: true, on: :update_password

  has_many :messages, dependent: :destroy
  has_many :users, through: :messages

  belongs_to :user

  validates :topic, presence: true, uniqueness: true, case_sensitive: false
  validates :password, length: { minimum: 6 }, unless: :skip_password_validation, on: :create

  private

  def skip_password_validation
    puts !is_private
    !is_private
  end
end
