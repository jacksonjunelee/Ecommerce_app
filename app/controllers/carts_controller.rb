class CartsController < ApplicationController

  def show
    @products = current_user.products.sort_by {|product| product.id}
    total = 0
    @products.each do |product|
      quantity = current_user.product_quantity(product.id)
      total += product.price * quantity
    end
    @total = Money.new(total, "USD").format
  end

  def add
    product = Product.find(params[:product_id])
    if !current_user.products.include? product and product.quantity != 0
      current_user.products << product
      product_to_update = current_user.product_to_update(product.id)
    elsif product.quantity == 0
      flash[:notice] = "Out of Stock"
      redirect_to root_path and return
    else
      product_to_update = current_user.product_to_update(params[:product_id])
    end
    product_to_update.quantity = product_to_update.quantity.to_i + 1
    product_to_update.save
    redirect_to root_path
  end

  def update
    product_to_update = current_user.product_to_update(params[:product_id])
    product_to_update.quantity = params[:product_quantity]
    product = product_to_update.product
    product.quantity -= product_to_update.quantity
    if product_to_update.valid? and product.valid?
      product_to_update.save
      redirect_to carts_path
    else
      flash[:notice] = "Unable to Update, Check your Cart or Contact Administrator"
      redirect_to carts_path
    end
  end

  def remove
    product = current_user.product_to_update(params[:product_id])
    product.delete
    redirect_to carts_path
  end

end
