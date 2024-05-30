class AddMetaIdAndUserIdToChamps < ActiveRecord::Migration[7.0]
  def change
    add_column :champs, :meta_id, :integer
    add_column :champs, :user_id, :integer
  end
end
