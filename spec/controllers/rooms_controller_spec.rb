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

    it 'can be filtered by name' do
      room1 = create :room
      room2 = create :room
      get :index, { name: room1.name }
      results = json['rooms']
      expect(results.count).to eq(1)
      expect(results.first['name']).to eq(room1.name)
    end
  end

end
