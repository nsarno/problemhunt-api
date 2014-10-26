require "rails_helper"

RSpec.describe UpvotesController, :type => :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/upvotes").to route_to("upvotes#create")
    end

  end
end
