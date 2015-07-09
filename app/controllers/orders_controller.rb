class OrdersController < ApplicationController

  def new
    if current_user.cart_number == 0
      flash[:notice] = "Nothing in Cart"
      redirect_to carts_path
    else
      @order = Order.new
      @order.total = params[:total]
    end
  end

  def summary
    @order = Order.new(order_params)
    render :summary
  end

  def create
    if order = Order.create(order_params)
      current_user.product_quantities.each do |order_history|
        order_history.product.quantity -= order_history.quantity
        order_history.product.save
        OrderHistory.create({
          product_id: order_history.product_id,
          user_id: order_history.user_id,
          order_id: order.id,
          quantity: order_history.quantity
          })
      end
      current_user.products.delete_all
		  redirect_to root_path
    else
      redirect_to new_orders_path
    end
  end

  private

	def order_params
		params.require(:order).permit(:firstname, :lastname, :address, :state, :city, :zipcode, :total, :user_id)
	end
end
