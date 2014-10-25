require 'rails_helper'

RSpec.describe AuthController, :type => :controller do
  describe 'GET #create' do

    before :each do
      @user = create(:user) 
      post :create, { user: { email: @user.email, password: @user.password }}
    end

    it 'responds with success' do
      expect(response.status).to eq(200)
    end

    it 'generates a JWT token' do
      expect(json).to have_key('token')
    end
  end
end

