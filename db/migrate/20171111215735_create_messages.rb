class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages, id: :uuid do |t|
      t.string :text
      t.jsonb :incoming
      t.uuid :chat_service_id
      t.timestamps
    end
  end
end
