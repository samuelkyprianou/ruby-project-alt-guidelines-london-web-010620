class Shoe < ActiveRecord::Base
  belongs_to :seller
  belongs_to :brand

  def price_range
    CommandLineInterface.price_range_print
    input = gets.chomp
    if input.downcase == "exit" || "4"
    elsif input == "1"
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
      CommandLineInterface.print_to_screen(a)
      exit_function
    end
  end

  def medium_price_range
    b = Shoe.where(price: 51..100)
    if b.empty?
      puts "No shoes available in that price range. Please select another option"
      price_range
    else
      CommandLineInterface.print_to_screen(b)
      exit_function
    end
  end

  def high_price_range
    c = Shoe.where("price > ?", 100)
    if c.empty?
      puts "No shoes available in that price range. Please select another option"
      price_range
    else
      CommandLineInterface.print_to_screen(c)
      exit_function
    end
  end

  def exit_function
    puts "If you would like to choose another option please type 1, or exit to return to the main menu."
    input = gets.chomp
    if input == "1"
      price_range
    elsif input.downcase == "exit"
    else
      puts "Invalid Option, please try again."
      exit_function
    end
  end
end
