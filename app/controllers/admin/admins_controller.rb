# frozen_string_literal: true

class Admin::AdminsController < ApplicationController
  before_action :check_admin

  private

  def check_admin
    render 'home/index' unless current_user.admin?
  end
end
