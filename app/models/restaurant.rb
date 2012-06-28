class Restaurant < ActiveRecord::Base
  attr_accessible :description, :name, :phone, :state, :street_address, :street_address_2, :zipcode, :tag_names

  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  attr_writer :tag_names

  def tag_names
    @tag_names || tags.map(&:name).join(', ')
  end

  #accepts_nested_attributes_for :tags, :allow_destroy => :true, 
  #	:reject_if => proc { |attrs| attrs.all? { |k, v| v.blank?}}

after_save :assign_tags

def self.search(search)
  search_condition = "%" + search + "%"
  find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
end



  private

  def assign_tags
  	if @tag_names
  		self.tags = @tag_names.split( /, */ ).map do |name|
  			Tag.find_or_create_by_name(name)
      end
    end
  end
end
