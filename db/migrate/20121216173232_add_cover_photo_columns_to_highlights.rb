class AddCoverPhotoColumnsToHighlights < ActiveRecord::Migration
  def self.up
    add_attachment :highlights, :cover_photo
  end
  
  def self.down
    remove_attachment :highlights, :cover_photo
  end
end
