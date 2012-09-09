class Product < ActiveRecord::Base
  belongs_to :group
  attr_accessible :description, :name
end
