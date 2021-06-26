class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['USERNAME_KEY'], password: ENV['PASSWORD_KEY']
  include HttpAuthConcern
  def show
    @categoryCount = Category.count
    @productsCount = Product.count
  end
  
end
