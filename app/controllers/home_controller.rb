class HomeController < ApplicationController
  def index
 
  	@terms = SearchTerm.all
  
  end
end
