class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.string :description
      t.references :celebration
      t.date :start_date
      t.date :end_date
      t.string :default_cover

      t.timestamps
    end
    add_index :highlights, :celebration_id
  end
end
