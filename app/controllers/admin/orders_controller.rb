class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @orders = Order.all
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      redirect_to admin_orders_path
    else
      render :edit
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :product_id, :order_status)
  end
end
