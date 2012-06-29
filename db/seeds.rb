# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Terms = SearchTerm.create([{name: 'Pizza'}, {name: 'Chicken'}, {name: 'Burgers'}, {name: 'Chinese'}, {name: 'Thai'}])
Tags = Tags.create([{name: 'Pizza'}, {name: 'Chicken'}, {name: 'Burgers'}, {name: 'Chinese'}, {name: 'Thai'}])


Restaurants = Restaurant.create
Restaurants << [
blueberryHill = {
	name: "Blueberry Hill",
	street_address: "15151 Delmar Blvd.",
# => Street_address_2: "",
	zipcode: "12345",
	state: "MO"
	description: "This place is in the Loop. Beer on Tap!",
	phone: "314-820-1234"
},
piPizzeria= {
	name: "Pi Pizzeria",
	street_address: "12344 Delmar Blvd.",
# => Street_address_2: "",
	zipcode: "12345",
	state: "MO"
	description: "The Presidents favorite Pizza!",
	phone: "314-820-2345"
}
]