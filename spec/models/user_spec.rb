require 'rails_helper'

RSpec.describe User, type: :model do
  describe "model validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe "model assocations" do
    it { is_expected.to have_many(:orders) }
  end
end
