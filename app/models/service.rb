class Service < ApplicationRecord
  has_many :chat_services
  has_many :telegram_chats, through: :chat_service
  # has_many :users, through: :telegram_chat
end
