class AddKategoriIdToMetamons < ActiveRecord::Migration[7.0]
  def change
    add_column :metamons, :kategori_id, :integer
  end
end
