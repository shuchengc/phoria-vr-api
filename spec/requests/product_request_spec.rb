require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe 'GET /products' do
    let (:product_url) {'/products'}

    before do
      FactoryBot.create_list(:product, 3)
      get product_url
    end

    it 'should get correct result' do
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).count).to eq(3)
    end
  end

end
