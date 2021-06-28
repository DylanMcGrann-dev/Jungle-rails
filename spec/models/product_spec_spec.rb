require 'rails_helper'

RSpec.describe ProductSpec, type: :model do
  describe "validations" do
    it 'should not exist for new records' do
      @category = Category.new("shoes")
      @product = Product.new
      expect(@produc.id).to be_nil
  end
end
