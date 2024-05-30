class AddUserIdToTemps < ActiveRecord::Migration[7.0]
  def change
    add_reference :temps, :user, null: false, foreign_key: true
  end
end
