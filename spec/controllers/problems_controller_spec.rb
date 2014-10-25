require 'rails_helper'

RSpec.describe ProblemsController, :type => :controller do

  describe "GET index" do
    it "responds with success" do
      get :index
      expect(response.status).to be(200)
    end
  end
end
