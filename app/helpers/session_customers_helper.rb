# frozen_string_literal: true

module SessionCustomersHelper
  def customer_log_in(customer)
    session[:customer_id] = customer.id
  end

  def customer_log_out
    # forget_customer(current_user)
    session.delete(:customer_id)
    @current_user = nil
  end

  def current_customer
    @current_customer = Customer.find_by(id: session[:customer_id])
    return @current_customer if @current_customer.present?
    customer_id = cookies.signed[:customer_id]
    return if customer_id.blank?
    customer = Customer.find_by(id: customer_id)
    if customer && customer.authenticated?(cookies[:remember_token])
      customer_log_in customer
      @current_customer = customer
    end
  end

  def current_customer?(customer)
    customer == current_customer
  end

  def logged_in_customer?
    !current_customer.nil?
  end

  # def remember_customer(customer)
  #   customer.remember
  #   cookies.permanent.signed[:customer_id] = customer.id
  #   cookies.permanent[:remember_token] = customer.remember_token
  # end

  # def forget_customer(customer)
  #   customer.forget
  #   cookies.delete(:customer_id)
  #   cookies.delete(:remember_token)
  # end

  def redirect_back
    redirect_to(session[:forwarding_url] || root_path)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
