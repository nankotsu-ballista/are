class CreateScoreMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :score_maps do |t|
      t.string :me
      t.integer :situation_id
      t.string :situationname
      t.integer :temp_id
      t.integer :metamon_id
      t.integer :user_id

      t.timestamps
    end
  end
end
