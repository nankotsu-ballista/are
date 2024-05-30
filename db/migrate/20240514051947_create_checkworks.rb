class CreateCheckworks < ActiveRecord::Migration[7.0]
  def change
    create_table :checkworks do |t|
      t.boolean :temping
      t.boolean :metaing
      t.string :user_id

      t.timestamps
    end
  end
end
