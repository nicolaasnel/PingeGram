class Message < ApplicationRecord
  belongs_to :chat_service
  has_one :telegram_chat, through: :chat_service
  has_one :service, through: :chat_service

  after_create :limit_messages

  private

  def limit_messages
    Message.where(id: old_message_ids).delete_all
  end

  def old_message_ids
    Message.where(chat_service: self.chat_service).order(created_at: :desc).offset(10).ids
  end

end
