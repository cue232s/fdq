require 'test_helper'

class SearchTermTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should always require a name" do
  	term = SearchTerm.new
  	assert !term.save
  end

  
end
