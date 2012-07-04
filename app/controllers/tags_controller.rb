class TagsController < ApplicationController
	def index


		@tags = Tag.all

		if @tags 
			@tagged = []

			Tag.all.each do |t|
				if !t.restaurants.nil?
					@tagged << t
				end
			end
		else 
			flash.now[:error] = "There currently no tags that exist"
		end

	end
	#this actions shows all the associated restaurants of a given Tag (keyword).
	def show_restaurants

		@tag = Tag.find(params[:id])
		if params[:ids]
			if params
			@restaurants = Restaurant.find(params[:ids])
		end


		end

	end

end
