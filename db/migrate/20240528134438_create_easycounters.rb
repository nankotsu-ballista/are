class CreateEasycounters < ActiveRecord::Migration[7.0]
  def change
    create_table :easycounters do |t|
      t.integer :meta_id
      t.integer :user_id
      t.integer :x
      t.integer :y
      t.string :name1
      t.string :name2

      t.timestamps
    end
  end
end
