class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def summary
    @order = Order.new(order_params)
    render :summary
  end

  def create
    if Order.create(order_params)
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
