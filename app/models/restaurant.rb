class Restaurant < ActiveRecord::Base
  attr_accessible :description, :name, :phone, :state, :street_address, :street_address_2, :zipcode

  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  attr_accessor :tag_names

  #accepts_nested_attributes_for :tags, :allow_destroy => :true, 
  #	:reject_if => proc { |attrs| attrs.all? { |k, v| v.blank?}}

after_save :assign_tags



private

def assign_tags
	if @tag_names
		self.tags = @tags_names.split(/\s+/).map do |name|
			Tag.find_or_create_by_name(name)
	end

end

end
