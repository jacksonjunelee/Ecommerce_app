class CartsController < ApplicationController

  def show
    @products = current_user.products
  end

  def add
    product = Product.find(params[:product_id])
    if !current_user.products.include? product
      current_user.products << product
      product_to_update = current_user.product_quantities.where(product_id: product.id).first
      product_to_update.quantity = product_to_update.quantity.to_i + 1
      product_to_update.save
      redirect_to :root
    else
      product_to_update = current_user.product_quantities.where(product_id: params[:product_id]).first
      product_to_update.quantity = product_to_update.quantity.to_i + 1
      product_to_update.save
      redirect_to :root
    end
  end

  def update
    product = current_user.product_quantities.where(product_id: params[:product_id]).first
    product.quantity = params[:product_quantity]
    product.save
    redirect_to cart_path
  end

  def remove
    product = current_user.product_quantities.where(product_id: params[:product_id]).first
    product.delete
    redirect_to cart_path
  end

  def checkout
    @
  end

end
