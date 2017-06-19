class CategoriesController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    if params[:name].blank?
    @categories = Category.all.order("name ASC")
      end
  end

  def new
    @categories = Category.new
  end

  def show
  end

  def update
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
    redirect to categories_url
  end

private

  def category_params
    params.require(:category).permit(:name)
  end


end

