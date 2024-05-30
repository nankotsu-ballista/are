class AddPointToScoreMaps < ActiveRecord::Migration[7.0]
  def change
    add_column :score_maps, :point, :integer
  end
end
