class CreateChamps < ActiveRecord::Migration[7.0]
  def change
    create_table :champs do |t|
      t.string :name
      t.integer :champid
      t.timestamps
    end
  end
end
