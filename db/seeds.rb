require "faker"

b = Brand.create(brand_name: "New Balance")
3.times do
  s = Seller.create(name: Faker::Name.name)
  Shoe.create(shoe_name: Faker::Commerce.product_name, price: Faker::Commerce.price, rarity: ["High", "Medium", "Low"].sample, seller: s, brand: b)
end
