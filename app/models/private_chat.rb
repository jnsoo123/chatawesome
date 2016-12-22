class PrivateChat < ApplicationRecord
  belongs_to :user_one, class_name: 'User'
  belongs_to :user_two, class_name: 'User'

  has_many :messages, as: :chat, dependent: :destroy
end
