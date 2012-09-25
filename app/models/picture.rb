class Picture < ActiveRecord::Base
  belongs_to :product
  has_attached_file :picture, :styles => { medium: "300x300>", thumb: "100x100#" }
  
  attr_accessible :description, :product_id, :picture
  
  validates_presence_of :picture
  validates_attachment :picture, attachment_presence: true
end
