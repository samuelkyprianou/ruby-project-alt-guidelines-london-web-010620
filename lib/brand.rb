class Brand < ActiveRecord::Base
    has_many :shoes


    def print_to_screen(shoes_array)
        shoes_array.each do |shoe|
        print "-----------------------------\n" 
        puts "Name: #{shoe.shoe_name}"
        puts "Price: #{shoe.price}"
        puts "Rarity: #{shoe.rarity}"
        print "-----------------------------\n"
        end
    end


    def brand_search
        puts"Please enter a brand name:"
        input = gets.chomp
        brand = Brand.find_by(brand_name: input)
        if brand == nil
            puts "Sorry, there is no current stock of this brand."
            brand_search
        else
        shoes = Shoe.where(brand: brand)
        print_to_screen(shoes)
        end
    end



end