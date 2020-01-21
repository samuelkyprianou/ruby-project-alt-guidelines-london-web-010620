class CommandLineInterface
    def greet
        puts "Welcome to Crep Nation, the fastest and most efficient app to sell branded shoes"
    end 
    
    def select_function
    puts "Please enter the number corresponding to the function you would like to use today:"
    puts "
    1. Search by Brand Name
    2. Search by Price Range
    3. Create new Seller Account
    4. Delete a Seller Account
    5. Exit"
    input = gets.chomp
    input
      
    end
end
