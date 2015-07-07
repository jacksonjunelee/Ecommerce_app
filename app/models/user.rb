class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products, through: :product_quantities
  has_many :product_quantities

  def cart
    self.products.length
  end

  def product_quantity(id)
    self.product_quantities.where(product_id: id).first.quantity
  end

  def cart_number
    cart_number = 0
    self.product_quantities.each { |product| cart_number += product.quantity}
    return cart_number
  end
end
