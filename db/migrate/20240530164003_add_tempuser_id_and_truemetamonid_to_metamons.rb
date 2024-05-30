class AddTempuserIdAndTruemetamonidToMetamons < ActiveRecord::Migration[7.0]
  def change
    add_column :metamons, :tempuser_id, :integer
    add_column :metamons, :truemetamonid, :integer
  end
end
