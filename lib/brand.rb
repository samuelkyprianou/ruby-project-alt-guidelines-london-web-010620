class Brand < ActiveRecord::Base
    has_many :shoes

     def brand_search
         puts"Please enter a brand name to get started:"
         input = gets.chomp
         brand = Brand.find_by(brand_name: input)
         shoes = Shoe.find_by(brand_id: brand)
         puts "Name: #{shoes.shoe_name}"
         puts "Price: #{shoes.price}"
         puts "Rarity: #{shoes.rarity}"
     end

    
end