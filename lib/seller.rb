class Seller < ActiveRecord::Base
  has_many :shoes
  has_many :brands, through: :shoes

  def create_account
    ActiveRecord::Base.logger = nil
    puts "To create an account please specify a username or input exit to return to the main menu:"
    input = gets.chomp
    existing_user = Seller.find_by(name: input)
    if input.downcase == "exit"
      system "clear"
    elsif !existing_user
      new_user = Seller.create(name: input)
      system "clear"
      CommandLineInterface.loading
      puts "Account has been successfully created. Welcome, #{input}!"
      sleep(3)
      invoke_seller_function(new_user)
    else
      CommandLineInterface.loading
      puts "Sorry Username #{input} is taken, please try again."
      sleep(5)
      create_account
    end
  end

  def delete_account
    ActiveRecord::Base.logger = nil
    puts "To confirm you would like to delete your account, please specify your username or input exit to return to the main menu:"
    input = gets.chomp
    existing_user = Seller.find_by(name: input)
    if input.downcase == "exit"
    elsif !existing_user
      CommandLineInterface.loading
      puts "User does not exist please try again"
      sleep(2)
      delete_account
    else
      shoe_array = existing_user.shoes
      Shoe.destroy_shoes(shoe_array)
      existing_user.destroy
      CommandLineInterface.loading
      puts "Your account has been successfully deleted, many thanks for using our platform."
      pid = fork { exec "afplay", "lib/soundfile/ByeBye.mp3" }
      sleep(5)
      system "clear"
    end
  end

  def login
    puts "Hi! Please enter your username to login or input exit to return to the main menu"
    input = gets.chomp
    existing_user = Seller.find_by(name: input)
    if input.downcase == "exit"
    elsif !existing_user
      puts "User does not exist please try again"
      login
    else
      system "clear"
      puts "Welcome back #{existing_user.name}."
      sleep(2)
      invoke_seller_function(existing_user)
    end
  end

  def invoke_seller_function(existing_user)
    quit = false
    while quit == false
      CommandLineInterface.seller_functions
      input = gets.chomp
      if input == "1"
        system "clear"
        current_shoe_listings(existing_user)
      elsif input == "2"
        create_a_shoe_listing(existing_user)
      elsif input == "3"
        update_price(existing_user)
      elsif input == "4"
        quit = true
        delete_account
      elsif input == "5"
        quit = true
        system "clear"
      else
        puts "Invalid option, please try again"
      end
    end
  end

  def current_shoe_listings(existing_user)
    ActiveRecord::Base.logger = nil
    a = existing_user.shoes
    if a.empty?
      CommandLineInterface.loading
      puts "Currently you do not have any shoes listed"
      sleep(4)
      system "clear"
    else
      CommandLineInterface.print_to_screen(a)
      sleep(3)
    end
    a
  end

  def select_shoe(existing_user)
    a = current_shoe_listings(existing_user)
    if a.empty?
    else
      puts "Please select the shoe number you would like to update?"
      print "----------------------------------------------------\n"
      input = gets.chomp
      while input.scan(/\D/).any? || input.empty? || !input.to_i.between?(0, a.count)
        puts "Invalid option - Please try again."
        input = gets.chomp
      end
      shoe = a[input.to_i - 1]
      # require "pry"; binding.pry
    end
    shoe
  end

  def update_price(existing_user)
    ActiveRecord::Base.logger = nil
    shoe = select_shoe(existing_user)
    puts "Current price of this shoe is £#{shoe.price}."
    sleep(2)
    print "------------------------------------------\n"
    sleep(2)
    puts "Please enter the new price of this shoe:"
    input = gets.chomp
    CommandLineInterface.loading
    while input.scan(/\D/).any? || input.blank?
      puts "Invalid price - Please enter a numerical value."
      input = gets.chomp
      CommandLineInterface.loading
    end
    shoe.price = input.to_i
    shoe.save
    puts "#{shoe.shoe_name} price has successfully been updated to £#{shoe.price}."
    sleep(4)
    print "----------------------------------------------------------------------\n"
    system "clear"
  end

  def create_a_shoe_listing(existing_user)
    a = []
    shoe = Shoe.create_shoe
    brand = Brand.brand_creation
    shoe.update(seller_id: existing_user.id, brand_id: brand.id)
    s = Shoe.last
    a << s
    CommandLineInterface.loading
    CommandLineInterface.print_to_screen(a)
    pid = fork { exec "afplay", "lib/soundfile/CaChing.mp3" }
    puts "Your shoe has been successfully listed. ££££££ "
    sleep(5)
    system "clear"
  end
end
