FactoryBot.define do
  factory :order_item do
    product_id {FactoryBot.create(:product).id}
    order_id {FactoryBot.create(:order).id}
  end
end
