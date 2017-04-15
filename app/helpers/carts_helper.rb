# frozen_string_literal: true

module CartsHelper
  def estimate_price(cart_products)
    sum = 0
    cart_products.each do |cart_product|
      sum += price_product(cart_product)
    end
    sum
  end

  def price_product(cart_product)
    num_product = cart_product.quantity
    return num_product * cart_product.product.price if cart_product.product.discount_price.nil?
    num_product * cart_product.product.discount_price
  end
end
