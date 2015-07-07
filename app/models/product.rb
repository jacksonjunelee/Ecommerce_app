class Product < ActiveRecord::Base
  has_many :users, through: :product_quantities
  has_many :product_quantities
end
