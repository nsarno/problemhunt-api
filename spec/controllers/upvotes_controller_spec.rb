require 'rails_helper'

RSpec.describe UpvotesController, :type => :controller do
  let(:problem) { create :problem }

  before(:each) do
    @current_user = create :user
    controller.stub(:authenticate) { @current_user }
    controller.stub(:current_user) { @current_user }
  end

  describe 'POST create' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      post :create, room_id: problem.room.id, problem_id: problem.id
      expect(response.status).to eq(401)
    end

    it 'responds with success' do
      post :create, room_id: problem.room.id, problem_id: problem.id
      expect(response.status).to be(201)
    end
  end

  describe 'DELETE create' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      delete :destroy, room_id: problem.room.id, problem_id: problem.id, id: 1
      expect(response.status).to eq(401)
    end

    it 'responds with success' do
      upvote = create :upvote, user: @current_user, problem: problem
      delete :destroy, room_id: problem.room.id, problem_id: problem.id, id: upvote.id
      expect(response.status).to be(204)
    end
  end

end
