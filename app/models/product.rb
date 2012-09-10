class Product < ActiveRecord::Base
  belongs_to :group
  has_and_belongs_to_many :tag
  
  attr_accessible :description, :name, :group_id, :tag_ids
  
  validates_presence_of :name, :group
  
end
