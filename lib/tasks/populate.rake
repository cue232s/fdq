namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require "populator"
    require "faker"
    
    [Restaurant, Tag, Tagging, SearchTerm].each(&:delete_all)
    
    Tag.populate 10 do |t|
      t.name = Populator.words(1..2).titleize

      SearchTerm.populate 1 do |st|
          st.name = t.name
        end
    end

    Restaurant.populate 10..25 do |restaurant|
      restaurant.name = Populator.words(1..4).titleize
      restaurant.street_address = Faker::Address.street_address
      restaurant.description = Populator.sentences(2..8)
      restaurant.zipcode = Faker::Address.zip_code   
      restaurant.state = "MO"      
      restaurant.phone = Faker::PhoneNumber.phone_number
    end

    Tagging.populate 6 do |tg|
      restaurants = Restaurant.all
      tg.restaurant_id = restaurants[rand(restaurants.length)].id 
      tag = Tag.all
      tg.tag_id = tag[rand(tag.length)].id
    end

  end
end