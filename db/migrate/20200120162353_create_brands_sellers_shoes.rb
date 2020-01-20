class CreateBrandsSellersShoes < ActiveRecord::Migration[5.1]
  def change
    create_table :sellers do |t|
      t.string :name
  end

    create_table :brands do |t|
      t.string :brand_name
    end

      create_table :shoes do |t|
        t.string :shoe_name
        t.integer :price
        t.string :rarity
        t.integer :seller_id
        t.integer :brand_id
      end
    end
end
