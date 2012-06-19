require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should show all restaurants" do
  	assert Restaurant.exists?
  end

  test "should create a new restaurant" do
  restaurant = Restaurant.new
  
  end
end
