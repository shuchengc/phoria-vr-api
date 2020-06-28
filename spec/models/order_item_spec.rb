require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe "model validations" do
    it { is_expected.to validate_presence_of(:quantity) }
  end

  describe "model assocations" do
    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:product) }
  end
end
