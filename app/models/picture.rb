class Picture < ActiveRecord::Base
  belongs_to :product
  has_attached_file :picture, :styles => { medium: "300x300>", thumb: "206x115#" }
  
  attr_accessible :description, :product_id, :picture
  
  validates_presence_of :picture
  validates_attachment :picture, attachment_presence: true
  
  before_create :default_description
  
  def default_description
    self.description ||= File.basename(picture.path, File.extname(picture.path)).titleize if picture
  end
end
