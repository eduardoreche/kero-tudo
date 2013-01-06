class Product < ActiveRecord::Base
  belongs_to :group
  has_many :pictures
  has_many :taggings
  has_many :tags, through: :taggings
  
  attr_accessible :description, :name, :group_id, :tag_ids, :pictures
  
  validates_presence_of :name, :group
  
end
