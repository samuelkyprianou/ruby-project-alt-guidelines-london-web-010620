class Shoe < ActiveRecord::Base
  belongs_to :seller
  belongs_to :brand

  def price_range
    quit = false
    while quit == false
      prompt = TTY::Prompt.new
      menu_options = ["£1 - 50", "£51 - 100", "£101+", "Exit"]
      menu = prompt.select("Select one of the options below:", menu_options, filter: true)
      case menu
      when "Exit"
        quit = true
        system "clear"
      when "£1 - 50"
        low_price_range
        sleep(2)
      when "£51 - 100"
        medium_price_range
        sleep(2)
      when "£101+"
        high_price_range
        sleep(2)
      end
    end
  end

  def low_price_range
    a = Shoe.where(price: 1..50)
    if a.empty?
      puts "No shoes available in that price range. Please select another option"
      price_range
    else
      CommandLineInterface.print_to_screen(a)
    end
  end

  def medium_price_range
    b = Shoe.where(price: 51..100)
    if b.empty?
      puts "No shoes available in that price range. Please select another option"
      price_range
    else
      CommandLineInterface.print_to_screen(b)
    end
  end

  def high_price_range
    c = Shoe.where("price > ?", 100)
    if c.empty?
      puts "No shoes available in that price range. Please select another option"
      price_range
    else
      CommandLineInterface.print_to_screen(c)
    end
  end

  def self.create_shoe
    puts "Please input the name of your shoe:"
    name_input = gets.chomp
    while name_input.blank?
      puts "Invalid name - Please re-enter your shoe name:"
      name_input = gets.chomp
    end
    puts "Please input the price of your shoe:"
    price_input = gets.chomp
    while price_input.scan(/\D/).any? || price_input.blank?
      puts "Invalid price - Please re-enter a numeric value:"
      price_input = gets.chomp
    end
    Shoe.create(shoe_name: name_input, price: price_input, rarity: ["High", "Medium", "Low"].sample)
  end

  def self.destroy_shoes(array_of_shoes)
    array_of_shoes.each { |shoe| shoe.destroy }
  end
end
