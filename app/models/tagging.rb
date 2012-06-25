class Tagging < ActiveRecord::Base
  attr_accessible :restaurant_id, :tag_id

  belongs_to :restaurant
  belongs_to :tag
end
 