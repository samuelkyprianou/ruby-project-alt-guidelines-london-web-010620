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
        2. Create a shoe listing
        3. Update price of a specific shoe
        4. Delete your account
        5. Logout"
  end

  def self.price_range_print
    puts "Please select your price range or type exit to go back to the main menu:"
    puts "
            1. £1 - 50
            2. £51 - 100
            3. £101+
            4. Exit
            "
  end

  def goodbye
    puts "
        

         ___              _ ___          _ 
        / __|___  ___  __| | _ )_  _ ___| |
       | (_ / _ \\/ _ \\/ _` | _ \\ || / -_)_|
        \\___\\ ___/\___/\\__,_|___/\\_, \\___(_)
                                |__/       
      
                                                     "
    puts "Many thanks for using Crep Nation, Goodbye!"
  end

  def self.loading
    sleep(1)
    print "------------------------------------------\n"
    sleep(1)
    print "------------------------------------------\n"
    sleep(2)
    print "------------------------------------------\n"
    sleep(2)
  end

  def self.brand_list(brands)
    ActiveRecord::Base.logger = nil
    counter = 0
    brands.each do |brand|
      puts "#{counter += 1}. #{brand.brand_name}"
    end
    puts "#{brands.count + 1}. Exit"
  end
end
