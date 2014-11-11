require 'rails_helper'

RSpec.describe ProblemsController, :type => :controller do

  let(:room) { create :room }

  before(:each) do
    @current_user = create :user
    controller.stub(:authenticate) { @current_user }
    controller.stub(:current_user) { @current_user }
  end

  describe "POST create" do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      post :create, problem: attributes_for(:problem).merge(room: room)
      expect(response.status).to eq(401)
    end

    it "responds with success" do
      post :create, problem: attributes_for(:problem).merge(room_id: room.id)
      expect(response.status).to be(201)
    end
  end
end
