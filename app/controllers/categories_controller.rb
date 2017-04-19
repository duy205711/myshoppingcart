# frozen_string_literal: true

class CategoriesController < Admin::AdminsController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = t('messages.category.success_created')
      redirect_to new_category_path
    else
      render :new
    end
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 30)
  end

  def edit
    @category = find_category
  end

  def update
    @category = find_category
    render edit_category_path(@category) unless @category.update_attributes(category_params)
    flash[:success] = t('messages.category.success_updated')
    redirect_to categories_path
  end

  def destroy
    @category = find_category
    @category.destroy
    redirect_to categories_path
    flash[:success] = t('messages.category.success_destroyed')
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    Category.find_by(id: params[:id])
  end
end
