class Tag < ActiveRecord::Base
  attr_accessible :name
  
  has_many :taggings
  has_many :products, through: :taggings
  
  has_many :celebration_taggings
  has_many :celebrations, through: :celebration_taggings
  
  validates_uniqueness_of :name
  validates_presence_of :name
end
