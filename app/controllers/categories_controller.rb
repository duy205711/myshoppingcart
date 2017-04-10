# frozen_string_literal: true

class CategoriesController < Admin::AdminsController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_param)
    if @category.save
      flash[:success] = t('messages.category.success_created')
      redirect_to new_category_path
    else
      render :new
    end
  end

  private

  def category_param
    params.require(:category).permit(:name)
  end
end
