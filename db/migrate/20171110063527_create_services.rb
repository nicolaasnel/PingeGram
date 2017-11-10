class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services, id: :uuid do |t|
      t.string :name
      t.integer :type

      t.timestamps
    end
  end
end
