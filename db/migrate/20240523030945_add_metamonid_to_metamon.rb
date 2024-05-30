class AddMetamonidToMetamon < ActiveRecord::Migration[7.0]
  def change
    add_column :metamons, :metamonid, :integer
  end
end
