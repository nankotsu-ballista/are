class AddUserIdToMetamons < ActiveRecord::Migration[7.0]
  def change
    add_column :metamons, :user_id, :integer
  end
end
