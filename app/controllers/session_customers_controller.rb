# frozen_string_literal:true

class SessionCustomersController < ApplicationController
  def new; end

  def create
    customer = Customer.find_by(email: params[:session_customers][:email].downcase)
    if customer && customer.authenticate(params[:session_customers][:password])
      customer_log_in customer
      # params[:session_customers][:remember_me] == '1' ? remember(customer) : forget(customer)
      redirect_back
    else
      flash.now[:danger] = t'messages.users.login_failed'
      redirect_to root_url
    end
  end

  def destroy
    customer_log_out if logged_in_customer?
    redirect_to root_url
  end
end
