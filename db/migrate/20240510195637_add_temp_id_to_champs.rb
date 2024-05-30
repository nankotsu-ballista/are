class AddTempIdToChamps < ActiveRecord::Migration[7.0]
  def change
    add_column :champs, :temp_id, :integer
  end
end
