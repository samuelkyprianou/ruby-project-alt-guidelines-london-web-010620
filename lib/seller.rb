class Seller < ActiveRecord::Base
  has_many :shoes

  def create_account
    puts "To create an account please specify a username or input exit to return to the main menu:"
    input = gets.chomp
    existing_user = Seller.find_by(name: input)
    if input.downcase == "exit"
    elsif !existing_user
      Seller.create(name: input)
      system "clear"
      CommandLineInterface.account_creation(input)
    else
      puts "Sorry this Username is taken, please try again."
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
      puts "User does not exist please try again"
      delete_account
    else
      existing_user.destroy
      puts "Your account has been successfully deleted, many thanks for using our platform."
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
      sleep(4)
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
        update_price(existing_user)
      elsif input == "3"
        quit = true
        delete_account
      elsif input == "4"
        quit = true
      else
        puts "Invalid option, please try again"
      end
    end
  end

  def current_shoe_listings(existing_user)
    ActiveRecord::Base.logger = nil
    a = existing_user.shoes
    # require 'pry' ; binding.pry
    if a.empty?
      puts "Currently you do not have any shoes listed"
      sleep(4)
      print "------------------------------------------\n"
      print "------------------------------------------\n"
      print "------------------------------------------\n"
    else
      CommandLineInterface.print_to_screen(a)
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
      shoe = a[input.to_i - 1]
    end
    shoe
  end

  def update_price(existing_user)
    ActiveRecord::Base.logger = nil
    shoe = select_shoe(existing_user)
    if !shoe
    else
      puts "Current price of this shoe is £#{shoe.price}."
      sleep(2)
      print "------------------------------------------\n"
      sleep(2)
      puts "Please enter the new price of this shoe:"
      input = gets.chomp
      shoe.price = input.to_i
      shoe.save
      print "----------------------------------------------------------------------\n"
      sleep(2)
      puts "#{shoe.shoe_name} price has successfully been updated to £#{shoe.price}."
      sleep(6)
      print "----------------------------------------------------------------------\n"
      system "clear"
    end
  end
end
