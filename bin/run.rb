require_relative '../config/environment'

quit = false

cli = CommandLineInterface.new
brand = Brand.new
shoe = Shoe.new
seller = Seller.new
while quit == false
cli.greet
function = cli.select_function

if function == "1"
    brand.brand_search
elsif
    function == "2"
    shoe.price_range
elsif 
    function == "3"
    seller.create_account
elsif 
    function == "4"
    seller.delete_account
else
    function == "5"
    quit = true
end

end
