class AddIfnewtempAndIfnewmetaToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :ifnewtemp, :integer
    add_column :users, :ifnewmeta, :integer
  end
end
