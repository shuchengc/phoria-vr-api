class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  accepts_nested_attributes_for :order_items, allow_destroy: true

  def totalPrice
    order_rule = {
      :shipping_fee => 30,
      :free_threshold => 10,
      :discount_threshold => 20,
      :discount => 0.9
    }.freeze

    quantity = order_items.reduce(0) {|sum, item| sum + item.quantity}
    sumPrice = order_items.reduce(0) {|sum, item| sum + item.quantity*item.product.price}
    if quantity < order_rule[:free_threshold] && quantity >0
      return sumPrice + order_rule[:shipping_fee]
    elsif quantity >= order_rule[:free_threshold] && quantity <order_rule[:discount_threshold]
      return sumPrice
    elsif quantity >=order_rule[:discount_threshold]
      return sumPrice * order_rule[:discount]
    end
  end
end
