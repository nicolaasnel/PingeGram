class AddDoNotRepeatToChatService < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_services, :do_not_repeat, :boolean, default: false
  end
end
