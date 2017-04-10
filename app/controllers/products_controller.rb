# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.order_by_time.paginate(page: params[:page], per_page: 3)
  end

  def show
    @product = find_product
  end

  private

  def find_product
    Product.find_by(id: params[:id])
  end
end
