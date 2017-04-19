# frozen_string_literal: true
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :decimal(, )

class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :product_id, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }, allow_nil: true
end
