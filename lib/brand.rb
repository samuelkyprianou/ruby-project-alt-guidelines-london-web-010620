class Brand < ActiveRecord::Base
  has_many :shoes
  has_many :sellers, through: :shoes

  def brand_search
    brands = Brand.all
    print "-----------------------------\n"
    puts "Please select the brand you would like to view or exit to return to the main menu:"
    CommandLineInterface.brand_list(brands)
    input = gets.chomp
    while !input.to_i.between?(1, brands.count + 1)
      puts "Invalid option - please try again."
      input = gets.chomp
    end
    brand_search_select(brands, input)
  end

  def brand_search_select(brands, input)
    if input.to_i == brands.count + 1
      system "clear"
    else
      brand = brands[input.to_i - 1]
      shoes = Shoe.where(brand: brand)
      CommandLineInterface.print_to_screen(shoes)
      sleep(2)
      brand_search
    end
  end

  def self.brand_creation
    puts "Please enter the brand of your shoe:"
    input = gets.chomp
    while input.blank?
      puts "Invalid brand - Please try again."
      input = gets.chomp
    end
    existing_brand = Brand.find_by(brand_name: input)
    if existing_brand
    else
      existing_brand = Brand.create(brand_name: input)
    end
    existing_brand
  end
end
