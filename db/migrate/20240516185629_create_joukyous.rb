class CreateJoukyous < ActiveRecord::Migration[7.0]
  def change
    create_table :joukyous do |t|
      t.string :name
      t.integer :temp_id
      t.integer :user_id
      t.integer :meta_id

      t.timestamps
    end
  end
end
