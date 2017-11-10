class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :telegram_chats
  has_many :chat_services, through: :telegram_chats
  has_many :services, through: :chat_services

  accepts_nested_attributes_for :chat_services

  def display_name
    full_name.present? ? full_name : email
  end

  def full_name
    [first_name, last_name].join(' ').strip
  end
end
