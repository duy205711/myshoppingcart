# == Schema Information
#
# Table name: customers
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  phone_number    :string
#  birth_date      :datetime
#  sex             :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
