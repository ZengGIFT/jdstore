class ProductsController < ApplicationController
  def index
    @products = Product.all.is_on_shell
  end

  def show
    @product = Product.find(params[:id])
  end

  def addToCart
    if current_user
      @product = Product.find(params[:id])
      Order.create(product_id: @product.id, user_id: current_user.id, order_status: 1)
      redirect_to cart_index_path
    else
      flash[:notice] = "Please login"
    end
  end
end
