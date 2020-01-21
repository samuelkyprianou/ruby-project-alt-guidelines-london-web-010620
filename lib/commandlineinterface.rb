class CommandLineInterface
    def greet
        puts "Welcome to Crep Nation, the fastest and most efficident app to sell branded shoes"
    end 
    
    def select_function
    puts "Please enter the number corresponding to the function you would like to use today:"
    puts "
    1. Search by Brand Name
    2. Search by Price Range
    3. List all Current Items for Sale
    4. Add a new Listing
    5. Exit"
    input = gets.chomp
    input
      
    end


    # def brand_search
    #     puts"Please enter a brand name to get started:"
    #      input = gets.chomp
    #     brand = Brand.find_by(brand_name: input)
    #     Shoe.find_by(brand_id: brand)
    # end

    # def price_range
    #     puts "Please select your price range:"
    #     puts "1. £1 - 50
    #         2. £51 - 100
    #         3. £101+
    #              "
    #     input = gets.chomp
    #     if input =="1"
        
    # end

    # def price_range
    #     if price < 1 
    #         puts "Sorry we are out of stock"
    #     elsif price =< 50
    #         puts "This shoe is in stock and costs #{"
    # end
end
