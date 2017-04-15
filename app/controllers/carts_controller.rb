# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    # @cart = Cart.find_or_create_by(customer_id: current_customer.id)
    @cart = Cart.find_by(customer_id: current_customer.id)
  end

  def create
    @cart = Cart.find_or_create_by(customer_id: current_customer.id)
    cart_product = find_or_create_cart_products
    cart_product.update_attributes(quantity: cart_product.quantity.to_i + cart_param)
    redirect_to carts_path
  end

  def update
    cart_product = CartProduct.find_by(id: params[:cart_product_update][:cart_product_id])
    cart_product.update_attributes(quantity: params[:cart_product_update][:quantity].to_i)
    redirect_to carts_path
  end

  def destroy
    CartProduct.find(params[:id]).destroy
    redirect_to carts_path
  end

  private

  def find_or_create_cart_products
    @cart.cart_products.find_or_create_by(product_id: customer_cart_params[:product_id])
  end

  def cart_param
    return 1 if customer_cart_params[:quantity].to_i.zero?
    customer_cart_params[:quantity].to_i
  end

  def customer_cart_params
    params.require(:cart).permit(:product_id, :quantity)
  end
end
