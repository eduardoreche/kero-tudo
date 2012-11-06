class CelebrationTagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :celebration
  # attr_accessible :title, :body
end
