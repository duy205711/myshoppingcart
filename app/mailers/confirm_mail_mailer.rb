# frozen_string_literal: true

class ConfirmMailMailer < ApplicationMailer
  default from: 'rione94@gmail.com'
  add_template_helper(CartsHelper)
  add_template_helper(SessionCustomersHelper)
  helper CartsHelper
  helper SessionCustomersHelper
  def email_of_customer(customer)
    @user = customer
    @cart = customer.cart
    mail to: @user.email, subject: 'Confirm mail' do |format|
      format.html { render 'confirm_mail_mailer' }
    end
  end
end
