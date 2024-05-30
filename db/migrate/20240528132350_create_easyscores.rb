class CreateEasyscores < ActiveRecord::Migration[7.0]
  def change
    create_table :easyscores do |t|
      t.string :name
      t.string :name2
      t.integer :point
      t.integer :SC

      t.timestamps
    end
  end
end
