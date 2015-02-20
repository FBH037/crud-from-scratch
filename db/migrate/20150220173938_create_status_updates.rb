class CreateStatusUpdates < ActiveRecord::Migration
  def change
    create_table :status_updates do |t|
      t.text :status
      t.string :user
      t.integer :number_of_likes

      t.timestamps null: false
    end
  end
end
