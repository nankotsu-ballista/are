class AddEditingMetaTempToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :editing_meta_temp_id, :integer
    add_column :users, :editing_meta_temp_user_id, :integer
  end
end
