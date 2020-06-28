require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /users" do
    let(:sign_up_url) { '/users' }
    let(:valid_params) do
      {'user' => {
        'email' => 'cuishucheng@gmail.com',
        'password' => 'password',
        'password_confirmation' => 'password'
      }}
    end 

    before do
      post sign_up_url, params: valid_params
    end
    it 'should return new user with jwt' do
      expect(response).to have_http_status(201)
      expect(response.body).to include('jwt')
    end
  end

  describe "POST /user_token" do
    let(:sign_in_url) { '/user_token' }
    let(:valid_params) do
      {'auth' => {
        'email' => 'cuishucheng@gmail.com',
        'password' => 'password'
      }}
    end 

    before do
      FactoryBot.create(:user, email:'cuishucheng@gmail.com', password: 'password')
      post sign_in_url, params: valid_params
    end
    it 'should return new user with jwt' do
      expect(response).to have_http_status(201)
      expect(response.body).to include('jwt')
    end
  end

end
