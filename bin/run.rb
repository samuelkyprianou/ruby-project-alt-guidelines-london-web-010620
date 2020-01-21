require_relative '../config/environment'

cli = CommandLineInterface.new
brand = Brand.new
shoe = Shoe.new
cli.greet
function = cli.select_function
if function == "1"
    brand.brand_search
elsif
    function == "2"
    shoe.price_range
end




# def greet
#     puts "Welcome to App Name, the fastest and most efficident app to sell branded shoes"
# end 

# greet 