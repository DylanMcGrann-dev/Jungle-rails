class Admin::CategoriesController < ApplicationController
  def new
    @category = Category.new
  end
  def index
    @category = Category.order(id: :desc).all
  end
end