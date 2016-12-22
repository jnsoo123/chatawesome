class Message < ApplicationRecord
  belongs_to :chat, polymorphic: true
  belongs_to :user
end
