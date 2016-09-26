class Chatroom < ApplicationRecord
  has_secure_password(validations: false)
  
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages

  validates :topic, presence: true, uniqueness: true, case_sensitive: false
  validates_confirmation_of :password, if: :password_present?
  validates_presence_of :password, on: :create, if: :is_private?

  private

  def password_present?
    puts password.present?
    password.present?
  end
end
