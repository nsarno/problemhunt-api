require "rails_helper"

RSpec.describe UpvotesController, :type => :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/problems/1/upvotes").to route_to("upvotes#create", problem_id: "1")
    end

  end
end
