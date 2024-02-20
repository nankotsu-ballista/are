class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.string :enemy
      t.string :me

      t.timestamps
    end
  end
end
