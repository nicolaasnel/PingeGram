class ChatService < ApplicationRecord
  belongs_to :telegram_chat
  belongs_to :service
end
