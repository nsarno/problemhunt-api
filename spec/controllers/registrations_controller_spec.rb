require 'rails_helper'

RSpec.describe RegistrationsController, :type => :controller do

  let(:room) { create :room }

  before(:each) do
    @current_user = create :user
    controller.stub(:authenticate) { @current_user }
    controller.stub(:current_user) { @current_user }
  end

  describe 'POST create' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      post :create, room_id: room.id
      expect(response.status).to eq(401)
    end

    it 'responds with success' do
      post :create, room_id: room.id
      expect(response.status).to be(201)
    end
  end

  describe 'DELETE create' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      delete :destroy, room_id: room.id, id: 1
      expect(response.status).to eq(401)
    end

    it 'responds with success' do
      registration = create :registration, user: @current_user, room: room
      delete :destroy, room_id: room.id, id: registration.id
      expect(response.status).to be(204)
    end
  end
end