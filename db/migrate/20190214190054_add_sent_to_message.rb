class AddSentToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :sent, :boolean, default: false

    reversible do |update|
      update.up do
        Message.update_all(sent: true)
      end
    end
  end
end
