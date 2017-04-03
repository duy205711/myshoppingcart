# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :childrens, class_name: 'Category',foreign_key: 'parent_id'
  has_many :products_categories
  has_many :products, through: :products_categories
end

