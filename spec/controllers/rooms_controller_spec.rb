require 'rails_helper'

RSpec.describe RoomsController, :type => :controller do

  let(:room) { create :room }

  before(:each) do
    @current_user = create :user
    controller.stub(:authenticate) { @current_user }
    controller.stub(:current_user) { @current_user }
    RoomSerializer.any_instance.stub(scope: controller)
  end

  describe 'GET #index' do
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

  describe 'GET #show' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      get :show, id: room.id
      expect(response.status).to eq(401)
    end

    it 'responds with success' do
      get :show, id: room.id
      expect(response.status).to eq(200)
    end

    it 'renders the json of the room' do
      get :show, id: room.id
      expect(json).to have_key('room')
    end
  end
end
