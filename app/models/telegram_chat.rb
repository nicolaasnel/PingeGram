class TelegramChat < ApplicationRecord
  belongs_to :user
  has_many :chat_services
  has_many :services, through: :chat_services
end
