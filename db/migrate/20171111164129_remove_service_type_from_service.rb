class RemoveServiceTypeFromService < ActiveRecord::Migration[5.0]
  def change
    remove_column :services, :service_type
  end
end
