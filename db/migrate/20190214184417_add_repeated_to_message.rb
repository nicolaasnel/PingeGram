class AddRepeatedToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :repeated, :boolean, default: false
  end
end
