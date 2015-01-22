require 'rails_helper'

RSpec.describe RegistrationsController, :type => :controller do

  let(:current_user) { create :user }
  let(:room) { create :room }

  before(:each) do
    controller.stub(:authenticate)
    controller.stub(:current_user) { current_user }
  end

  describe 'POST create' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      post :create, id: room.id
      expect(response.status).to eq(401)
    end

    it 'responds with success' do
      post :create, id: room.id
      expect(response.status).to be(201)
    end
  end

  describe 'DELETE destroy' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      delete :destroy, id: room.id
      expect(response.status).to eq(401)
    end

    it 'responds with success' do
      create :registration, user: current_user, room: room
      delete :destroy, id: room.id
      expect(response.status).to be(204)
    end
  end
end
