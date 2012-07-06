namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require "populator"
    require "faker"
    
    [Restaurant, Tag, Tagging, SearchTerm].each(&:delete_all)
    
    Tag.populate 20 do |t|
      t.name = Populator.words(1..2).titleize
      
      SearchTerm.populate 1 do |st|
          st.name = t.name
      end

    end

    Restaurant.populate 30 do |restaurant|
      restaurant.name = Populator.words(1..3).titleize
      restaurant.street_address = Faker::Address.street_address
      restaurant.description = Populator.sentences(6..8)
      restaurant.zipcode = Faker::Address.zip_code   
      restaurant.state = "MO"      
      restaurant.phone = Faker::PhoneNumber.phone_number
    end


    #create 6 tags for each restaurant 
    Restaurant.all.each do |restaurant|
      rand_tag_array = Tag.all.sample Tag.all.size

      e = rand_tag_array.to_enum
      6. times do
        Tagging.create({:restaurant_id => restaurant.id, :tag_id => e.next.id})
      end 
    end

  end
end