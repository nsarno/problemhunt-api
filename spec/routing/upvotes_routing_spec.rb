require "rails_helper"

RSpec.describe UpvotesController, :type => :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/problems/1/upvote").to route_to("upvotes#create", id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/problems/1/downvote").to route_to("upvotes#destroy", id: "1")
    end

  end
end
