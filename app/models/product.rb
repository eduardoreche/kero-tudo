class Product < ActiveRecord::Base
  belongs_to :group
  has_many :pictures
  has_many :taggings
  has_many :tags, through: :taggings
  
  attr_accessible :description, :name, :group_id, :tag_ids, :pictures
  
  validates_presence_of :name, :group
  
  scope :filtered_by_group, lambda {|groups| where("group_id in (?)",groups).order("name").uniq}
  scope :filtered_by_tag, lambda {|tags| where("tag_id in (?)", tags).joins(:tags).order("name").uniq}
  
end
