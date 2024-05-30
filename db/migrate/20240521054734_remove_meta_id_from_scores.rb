class RemoveMetaIdFromScores < ActiveRecord::Migration[7.0]
  def change
    remove_column :scores, :meta_id, :integer
  end
end
