# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @products = Product.order_by_time.paginate(page: params[:page], per_page: 2)
  end
end
