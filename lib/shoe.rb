class Shoe < ActiveRecord::Base
    belongs_to :seller
    belongs_to :brand
    

    def print_price(a)
        a.each do |shoe|
        puts "This shoe #{shoe.shoe_name} is in stock and costs £#{shoe.price}"
        end 
    end

     def price_range
        puts "Please select your price range:"
            puts "
            1. £1 - 50
            2. £51 - 100
            3. £101+
            "
            input = gets.chomp
         if input == "1"
            low_price_range
         elsif input == "2"
            medium_price_range
        elsif input == "3"
            high_price_range
        else
            puts "Invalid Option, please try again."
            price_range
        end 
    end 

       



        def low_price_range
            a = Shoe.where(price: 1..50)
            if a.empty?
                puts "No shoes available in that price range. Please select another option"
                price_range
            else
            print_price(a)
            end
        end

        def medium_price_range
            b = Shoe.where(price: 51..100)
            if b.empty?
            puts "No shoes available in that price range. Please select another option"
            price_range
            else
            print_price(b)
            end
        end 

        def high_price_range
            c = Shoe.where("price > ?",  100)
            if c.empty?
            puts "No shoes available in that price range. Please select another option"
            price_range
            else
            print_price(c)
            end
        end

    end 