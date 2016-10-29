class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
      flash[:notice] = "娘子，我上了！"
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path
      flash[:notice] = "人心啊，反复啊反复，无常啊无常"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
    flash[:alert] = "相公，你这就下了？"
  end

  def publishProduct
    @product = Product.find(params[:id])
    @product.is_present = true
    @product.save

    redirect_to :back
  end

  def hideProduct
    @product = Product.find(params[:id])
    @product.is_present = false
    @product.save

    redirect_to :back
  end

  private

  def product_params
    params.require(:product).permit(:title,
    :description, :quantity, :price, :image, :is_present)
  end
end
