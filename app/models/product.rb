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

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :price, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :picture, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  mount_uploader :picture, PictureUploader
  scope :order_by_time, -> { order('created_at DESC') }
  scope :get_new_book, -> { order(id: :desc).limit(5) }
end
