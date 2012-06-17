class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :street_address
      t.string :street_address_2
      t.string :zipcode
      t.string :state
      t.text :description
      t.string :phone

      t.timestamps
    end
  end
end
