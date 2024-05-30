class CreateTemps < ActiveRecord::Migration[7.0]
  def change
    create_table :temps do |t|
      t.string :name
      t.integer :usertemp_id
      t.integer :temp_id

      t.timestamps
    end
  end
end
