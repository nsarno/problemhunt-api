require 'rails_helper'

RSpec.describe ProblemsController, :type => :controller do

  let(:room) { create :room }

  before(:each) do
    @current_user = create :user
    controller.stub(:authenticate) { @current_user }
    controller.stub(:current_user) { @current_user }
  end

  describe 'POST create' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      post :create, room_id: room.id, problem: attributes_for(:problem)
      expect(response.status).to eq(401)
    end

    it 'responds with success' do
      post :create, room_id: room.id, problem: attributes_for(:problem)
      expect(response.status).to be(201)
    end
  end

  describe 'DELETE destroy' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      delete :destroy, room_id: 1, id: 1
      expect(response.status).to be(401)
    end

    it 'responds with success' do
      problem = create :problem 
      delete :destroy, room_id: problem.room.id, id: problem.id
      expect(response.status).to be(204)
    end
  end
end
