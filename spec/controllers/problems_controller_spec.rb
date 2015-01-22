require 'rails_helper'

RSpec.describe ProblemsController, :type => :controller do

  let(:current_user) { create :user }
  let(:room) { create :room }

  before(:each) do
    controller.stub(:authenticate)
    controller.stub(:current_user) { current_user }
  end

  describe 'GET index' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      get :index, room_id: room.id
      expect(response.status).to eq(401)
    end

    it 'responds with success' do
      get :index, room_id: room.id
      expect(response.status).to eq(200)
    end

    it 'has key problems in json response' do
      get :index, room_id: room.id
      expect(json).to have_key('problems')
    end
  end

  describe 'POST create' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      post :create, room_id: room.id, problem: attributes_for(:problem, user: current_user)
      expect(response.status).to eq(401)
    end

    it 'responds with success' do
      post :create, room_id: room.id, problem: attributes_for(:problem, user: current_user)
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
      problem = create :problem, user: current_user
      delete :destroy, room_id: problem.room.id, id: problem.id
      expect(response.status).to be(204)
    end

    it 'only destroys problem from current user' do
      problem = create :problem
      delete :destroy, room_id: problem.room.id, id: problem.id
      expect(response.status).to be(404)
    end
  end
end
