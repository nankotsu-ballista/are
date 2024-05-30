class AddScToScores < ActiveRecord::Migration[7.0]
  def change
    add_column :scores, :SC, :integer
  end
end
