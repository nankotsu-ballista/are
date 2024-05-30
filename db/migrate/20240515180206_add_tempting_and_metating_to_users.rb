class AddTemptingAndMetatingToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tempting, :boolean
    add_column :users, :metating, :boolean
  end
end
