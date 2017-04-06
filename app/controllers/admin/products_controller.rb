# frozen_string_literal: true

class Admin::ProductsController < Admin::AdminsController
  def new
    @product = Product.new
  end

  def index
    @products = Product.order_by_time.paginate(page: params[:page], per_page: 100)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = t('messages.product.success_created')
      render :show
    else
      render :new
    end
  end

  def edit
    @product = find_product
  end

  def update
    @product = Product.find(params[:id])
    render edit_admin_product_path(@product) unless @product.update_attributes(product_params)
    flash[:success] = t('messages.product.success_updated')
    redirect_to admin_product_path(@product)
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = t('messages.product.success_destroyed')
    redirect_to admin_products_path
  end

  def show
    @product = find_product
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :picture)
  end

  private

  def find_product
    product = Product.find_by(id: params[:id])
    return redirect_to root_path if product.blank?
    product
  end
end
