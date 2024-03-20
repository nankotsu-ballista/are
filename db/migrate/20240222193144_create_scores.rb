class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.string :me
      t.string :enemy
      t.integer :point

      t.timestamps
    end
  end
end
