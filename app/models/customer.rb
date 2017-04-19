# frozen_string_literal: true
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

# frozen_string_literal: true

class Customer < ApplicationRecord
  before_save { self.email = email.downcase }

  has_one :cart, dependent: :destroy
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
