class Tag < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :product
  
  validates_presence_of :name
end
