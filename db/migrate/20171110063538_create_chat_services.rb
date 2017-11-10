class CreateChatServices < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_services, id: :uuid do |t|
      t.uuid :service_id
      t.uuid :telegram_chat_id
      t.boolean :enabled

      t.timestamps
    end
  end
end
