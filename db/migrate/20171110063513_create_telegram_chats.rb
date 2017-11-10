class CreateTelegramChats < ActiveRecord::Migration[5.0]
  def change
    create_table :telegram_chats, id: :uuid do |t|
      t.string :bot_token
      t.string :chat_id
      t.string :name
      t.uuid :user_id

      t.timestamps
    end
  end
end
