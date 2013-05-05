class AddSlugToHighlight < ActiveRecord::Migration
  def change
    add_column :highlights, :slug, :string
    
    add_index :highlights, :slug, unique: true
  end
end
