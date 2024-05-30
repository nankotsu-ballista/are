class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :doingtempid, :integer
    add_column :users, :doingtempuserid, :integer
  end
end
