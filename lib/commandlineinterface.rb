class CommandLineInterface
    def greet
        puts "

   /$$$$$$            /$$$$$$$$                 /$$   /$$        /$$$$$$$$ /$$  /$$$$$$           
  /$$__  $$          | $$_____/                | $$$ | $$       |__  $$__/|__/ /$$__  $$          
 | $$ \\__/   /$$$$$$ | $$        /$$$$$$       | $$$$| $$  /$$$$$$ | $$    /$$| $$  \\ $$ /$$$$$$$ 
 | $$       /$$__  $$| $$$$$    /$$__  $$      | $$ $$ $$ |____  $$| $$   | $$| $$  | $$| $$__  $$
 | $$      | $$  \\__/| $$__/   | $$  \\ $$      | $$  $$$$  /$$$$$$$| $$   | $$| $$  | $$| $$  \\ $$
 | $$    $$| $$      | $$      | $$  | $$      | $$\\  $$$ /$$__  $$| $$   | $$| $$  | $$| $$  | $$
 |  $$$$$$/| $$      | $$$$$$$$| $$$$$$$/      | $$\\  $$ |  $$$$$$$| $$   | $$|  $$$$$$/| $$  | $$
  \\______/ |__/      |________/| $$____/       |__/ \\__/ \\_______/ |__/   |__/ \\______/ |__/  |__/
                               | $$                                                               
                               | $$                                                               
                               |__/                                                                                                                           
            "
        puts "Welcome to Crep Nation, the fastest and most efficient app to sell branded shoes"
    end 
    
    def select_function
    puts "Please enter the number corresponding to the function you would like to use today:"
    puts "
    1. Search by Brand Name
    2. Search by Price Range
    3. Create new Seller Account
    4. Login
    5. Exit"
    input = gets.chomp
    input
    end

    def self.print_to_screen(shoes_array)
        ActiveRecord::Base.logger = nil
        counter = 0
        shoes_array.each do |shoe|
        print "-----------------------------\n" 
        puts "#{counter += 1}. Name: #{shoe.shoe_name}"
        puts "   Price: #{shoe.price}"
        puts "   Rarity: #{shoe.rarity}"
        puts "   Brand: #{shoe.brand.brand_name}"
        print "-----------------------------\n"
        end
    end

    def self.seller_functions
        puts "What would you like to do today?"
        puts "
        1. View your current shoe listings
        2. Update price of a specific shoe
        3. Delete your account
        4. Logout"
    end






end



