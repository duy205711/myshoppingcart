# frozen_string_literal: true
# Table name: carts
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :customer
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products, dependent: :destroy
end
