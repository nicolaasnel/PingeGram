class RemoveEnabledFromChatService < ActiveRecord::Migration[5.2]
  def change
    remove_column :chat_services, :enabled, :boolean
  end
end
