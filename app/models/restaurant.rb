class Restaurant < ActiveRecord::Base
  attr_accessible :description, :name, :phone, :state, :street_address, :street_address_2, :zipcode
end
