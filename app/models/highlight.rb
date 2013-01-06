class Highlight < ActiveRecord::Base
  belongs_to :celebration
  
  DEFAULT_COVERS = %w(blue gray red yellow)
  
  has_attached_file :cover_photo, 
                    :styles => {
                      :original => ["700x700>", :png],
                      :cropped => {geometry: "", :processors => [:cropper]}
                    }
                    
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessible :description, :end_date, :start_date, :default_cover, 
                  :cover_photo, :crop_x, :crop_y, :crop_w, :crop_h
  
  validates_presence_of :description
  validates_presence_of :celebration
  validates_presence_of :start_date
  validates_presence_of :end_date
  validate :file_dimensions, unless: "errors.any?", on: "create"
  
  def reprocess_cover_photo
    cover_photo.reprocess! if cropping?
  end

  def cropping?
    self.crop_x.present? && self.crop_y.present? && self.crop_w.present? && self.crop_h.present?
  end
  
  def file_dimensions 
    dimensions = Paperclip::Geometry.from_file(self.cover_photo.queued_for_write[:original])
    self.errors.add(:cover_photo, "Please upload a file at least 640px width") if dimensions.width < 640
    self.errors.add(:cover_photo, "Please upload a file at least 339px height") if dimensions.height < 339
  end
  
end
