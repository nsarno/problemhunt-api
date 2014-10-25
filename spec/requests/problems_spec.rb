require 'rails_helper'

RSpec.describe "Problems", :type => :request do
  describe "GET /problems" do
    it "works! (now write some real specs)" do
      get problems_path
      expect(response.status).to be(200)
    end
  end
end
