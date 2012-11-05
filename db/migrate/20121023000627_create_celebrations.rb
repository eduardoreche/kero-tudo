class CreateCelebrations < ActiveRecord::Migration
  def change
    create_table :celebrations do |t|
      t.string :description
      t.integer :day
      t.integer :month
      t.boolean :special

      t.timestamps
    end
  end
end
