class Celebration < ActiveRecord::Base
  
  has_many :celebration_taggings
  has_many :tags, through: :celebration_taggings
  
  attr_accessible :day, :description, :month, :special, :tag_ids
  
end
