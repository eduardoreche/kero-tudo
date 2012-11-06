class CreateCelebrationTaggings < ActiveRecord::Migration
  def change
    create_table :celebration_taggings do |t|
      t.belongs_to :tag
      t.belongs_to :celebration

      t.timestamps
    end
    add_index :celebration_taggings, :tag_id
    add_index :celebration_taggings, :celebration_id
  end
end
