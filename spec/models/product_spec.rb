require 'rails_helper'

RSpec.describe Product, :type => :model do
  describe "model validation" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:imageUrl) }
    it { is_expected.to validate_presence_of(:price) }
  end
end