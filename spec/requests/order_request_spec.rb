require 'rails_helper'

RSpec.describe "Orders", type: :request do
  def authenticated_header(user)
    token = Knock::AuthToken.new(payload: { sub: user.id, email: user.email }).token
    { 'Authorization': "Bearer #{token}" }
  end

  describe 'GET orders' do
    let(:url) { '/orders' }
    let(:user) { FactoryBot.create(:user) }

    describe 'without valid headers' do
      before do
        get url
      end
      it 'should return unauth error' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'valid headers' do
      before do
        FactoryBot.create_list(:order, 3, user_id: user.id)
        get url, headers: authenticated_header(user)
      end
      it 'should return orders' do
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body).count).to eq(3)
      end
    end
  end

  describe 'POST orders' do
    let(:url) { '/orders' }
    let(:user) { FactoryBot.create(:user) }
    let(:product1) { FactoryBot.create(:product) }
    let(:product2) { FactoryBot.create(:product) }
    let(:valid_params) do
      {
        "order" => {
          "user_id" => user.id,
          "order_items_attributes" => [
            {"product_id" => product1.id, "quantity" => 1},
            {"product_id" => product2.id, "quantity" => 2}
          ]
        }
      }
    end

    describe 'without valid headers' do
      before do
        post url, params: valid_params
      end
      it 'should return unauth error' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'valid headers' do
      before do
        post url, params: valid_params, headers: authenticated_header(user)
      end
      it 'should return orders' do
        expect(response).to have_http_status(201)
        expect(JSON.parse(response.body)['order_items'].count).to eq(2)
      end
    end
  end

end
