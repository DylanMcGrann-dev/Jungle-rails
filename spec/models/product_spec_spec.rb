require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
    it 'should exist when saved with all four feilds filled out' do
      @category = Category.new({name: 'shoes'})
      @product = Product.new(name: "dylan", price: 10, quantity: 11, category: @category)
      @product.save!
      expect(@product.id).to be_present
    end

    it "should return an error if a name is not given" do
      @category = Category.new({name: 'shoes'})
      @product = Product.new(name:nil , price: 10, quantity: 11, category: @category)
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid,"Validation failed: Name can't be blank")
      @product.errors.full_messages
    end


    it "should return an error if a price is not given" do
      @category = Category.new({name: 'shoes'})
      @product = Product.new(name:"dylan" ,quantity: 11, category: @category)
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid,"Validation failed: Price cents is not a number, Price is not a number, Price can't be blank")
    end

    it "should return an error if a quantity is not given" do
      @category = Category.new({name: 'shoes'})
      @product = Product.new(name:"dylan" ,price:11 , category: @category)
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid,"Validation failed: Quantity can't be blank")
    end

    it "should return an error if a category is not given" do
      @category = Category.new({name: 'shoes'})
      @product = Product.new(name:"dylan" , price:11, quantity: 11)
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid,"Validation failed: Category can't be blank")
    end

  end
end

