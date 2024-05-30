class AddTempIdToMetamon < ActiveRecord::Migration[7.0]
  def change
    add_column :metamons, :temp_id, :integer
  end
end
