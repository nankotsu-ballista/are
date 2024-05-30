class AddDetailsToScores < ActiveRecord::Migration[7.0]
  def change
    add_column :scores, :user_id, :integer
    add_column :scores, :temp_id, :integer
    add_column :scores, :meta_id, :integer
  end
end
