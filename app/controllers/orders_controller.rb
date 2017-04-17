# frozen_string_literal: true

class OrdersController < ApplicationController
  def new
    @order = Order.new
    @cart = Cart.find_by(customer_id: current_customer)
    @customer = current_customer
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      ConfirmMailMailer.email_of_customer(current_customer).deliver
      current_customer.cart.destroy
      flash[:notice] = 'Successfully Order...'
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order)
          .permit(:name, :email, :phone, :address_type, :address)
  end
end
