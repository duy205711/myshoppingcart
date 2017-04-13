# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not nul
#

class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :childrens, class_name: 'Category', foreign_key: 'parent_id'
  has_many :products_categories
  has_many :products, through: :products_categories

  validates :name, presence: true,
                   length: { maximum: 25 },
                   uniqueness: true,
                   allow_nil: true
  scope :get_comic_book, -> { Category.find_by(name: 'Comic').products.limit(5) }
  scope :get_story_book, -> { Category.find_by(name: 'Story').products.limit(5) }
end
