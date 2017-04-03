# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  price       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  has_many :products_categories
  has_many :categories, through: :products_categories
  has_many :orders_products
  has_many :orders, through: :orders_products
end
