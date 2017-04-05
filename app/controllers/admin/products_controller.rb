# frozen_string_literal: true

class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end
end
