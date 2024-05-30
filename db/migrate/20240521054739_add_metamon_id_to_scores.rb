class AddMetamonIdToScores < ActiveRecord::Migration[7.0]
  def change
    add_column :scores, :metamon_id, :integer
  end
end
