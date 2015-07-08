class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def summary
    @order = Order.new(order_params)
    render :summary
  end

  def create
    if order = Order.create(order_params)
      current_user.product_quantities.each do |history|
        OrderHistory.create({
          product_id: history.product_id,
          user_id: history.user_id,
          order_id: order.id,
          quantity: history.quantity
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
