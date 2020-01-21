class Shoe < ActiveRecord::Base
    belongs_to :seller
    belongs_to :brand
    
#     def price_range
#         puts "Please select your price range:"
#         puts "
#         1. £1 - 50
#         2. £51 - 100
#         3. £101+
#         "
#         input = gets.chomp
#         if input =="1"

#     end
end