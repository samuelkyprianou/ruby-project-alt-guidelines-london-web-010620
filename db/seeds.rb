require 'faker'

6.times do 

s = Seller.create(name: Faker::Name.name)
b = Brand.create(brand_name: Faker::Company.name)
Shoe.create(shoe_name: Faker::Commerce.product_name, price: Faker::Commerce.price, rarity: ["High", "Medium", "Low"].sample, seller_id: s.id, brand_id: b.id)

end