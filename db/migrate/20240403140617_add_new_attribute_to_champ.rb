class AddNewAttributeToChamp < ActiveRecord::Migration[7.0]
  def change
    add_column :champs, :priority, :integer
  end
end
