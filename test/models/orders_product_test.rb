# == Schema Information
#
# Table name: orders_products
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class OrdersProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
