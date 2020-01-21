class Shoe < ActiveRecord::Base
    belongs_to :seller
    belongs_to :brand
end
