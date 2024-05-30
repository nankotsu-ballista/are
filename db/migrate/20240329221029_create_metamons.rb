class CreateMetamons < ActiveRecord::Migration[7.0]
  def change
    create_table :metamons do |t|
      t.string :name
      t.string :setumei
      t.string :gamename
      t.integer :metaid

      t.timestamps
    end
  end
end
