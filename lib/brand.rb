class Brand < ActiveRecord::Base
  has_many :shoes

  def brand_search
    puts "Please enter a brand name to view products or type exit to go back to the main menu:"
    input = gets.chomp
    brand = Brand.find_by(brand_name: input)
    if input.downcase == "exit"
    elsif !brand
      puts "Sorry, there is no current stock of this brand."
      brand_search
    else
      shoes = Shoe.where(brand: brand)
      CommandLineInterface.print_to_screen(shoes)
      brand_search
    end
  end
end
