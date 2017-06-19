class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  def index
      @categories = Category.all.order("name ASC")
  end

  def new
    @categories = Category.new
  end

  def show
  end

  def update
    if @categories.update(category_params)
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def create
    @categories = Category.new(category_params)

    if @categories.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def destroy
    @categories.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
  @categories = Category.find(params[:id])
    end
end
