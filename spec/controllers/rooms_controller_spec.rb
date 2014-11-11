require 'rails_helper'

RSpec.describe RoomsController, :type => :controller do

  before(:each) do
    @current_user = create :user
    controller.stub(:authenticate) { @current_user }
  end

  describe "GET index" do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      get :index
      expect(response.status).to eq(401)
    end

    it 'responds with success' do
      get :index
      expect(response.status).to eq(200)
    end
  end

end
