class AddKategoriIdToTemps < ActiveRecord::Migration[7.0]
  def change
    add_column :temps, :kategori_id, :integer
  end
end
