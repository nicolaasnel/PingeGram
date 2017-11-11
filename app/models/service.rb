class Service < ApplicationRecord
  has_many :chat_services
  has_many :telegram_chats, through: :chat_services
  # has_many :users, through: :telegram_chats

  enum types: {
    pingdom: 'Pingdom'
  }
end
