require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "model assocations" do
    it { is_expected.to have_many(:order_items) }
    it { is_expected.to belong_to(:user)}
  end

  describe "totalPrice method" do
    let (:product) {FactoryBot.create(:product, price:20)}
    let (:user) {FactoryBot.create(:user)}
    let (:order) {FactoryBot.create(:order, user_id: user.id)}
   
    it "need $30 shipping fee when quantity less than 10" do
      order_items = FactoryBot.create_list(:order_item, 2, product_id: product.id, order_id: order.id, quantity:2)
      expect(order.totalPrice).to eq(110.0)
    end

    it "without $30 shipping fee when quantity larger equal 10 and less than 20" do
      order_items = FactoryBot.create_list(:order_item, 6, product_id: product.id, order_id: order.id, quantity:2)
      expect(order.totalPrice).to eq(240.0)
    end

    it "should get 10% discount when quantity larger equal than 20" do
      order_items = FactoryBot.create_list(:order_item, 10, product_id: product.id, order_id: order.id, quantity:2)
      expect(order.totalPrice).to eq(360.0)
    end
  end
end
