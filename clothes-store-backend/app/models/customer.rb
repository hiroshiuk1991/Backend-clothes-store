class Customer < ApplicationRecord
    has_one :cart 
    has_many :items, through: :cart
end
