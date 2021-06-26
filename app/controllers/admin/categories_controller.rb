class Admin::CategoriesController < ApplicationController
  def new
    @category = Category.new
  end
  def index
    @category = Category.all
    puts @category.name
  end
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'category created!'
    else
      render :new
    end
  end
end