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
