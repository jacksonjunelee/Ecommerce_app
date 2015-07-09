class Product < ActiveRecord::Base
  has_many :users, through: :product_quantities
  has_many :product_quantities
  validates_numericality_of :quantity, :only_integer =>true,
                          :greater_than_or_equal_to =>0,
                          :message => "Exceeded the amount we have In  Stock"

  def money_amount
    Money.new(self.price, "USD").format
  end

end
