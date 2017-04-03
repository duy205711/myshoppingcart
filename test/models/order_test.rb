# == Schema Information
#
# Table name: orders
#
#  id                :integer          not null, primary key
#  order_number      :string
#  user_id           :integer
#  name              :string
#  total_prices      :float
#  total_products    :integer
#  email             :string
#  address           :text
#  address_type      :integer
#  phone             :string
#  info              :text
#  payment_type      :integer
#  delivery_type     :integer
#  delivery_fee      :float
#  receipt_required  :boolean
#  delivery_time_min :datetime
#  delivery_time_max :datetime
#  status            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
