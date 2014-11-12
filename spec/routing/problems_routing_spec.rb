require "rails_helper"

RSpec.describe ProblemsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rooms/1/problems").to route_to("problems#index", room_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/rooms/1/problems/1").to route_to("problems#show", room_id: "1", id: "1")
    end

    it "routes to #create" do
      expect(:post => "/rooms/1/problems").to route_to("problems#create", room_id: "1")
    end

    it "routes to #update" do
      expect(:put => "/rooms/1/problems/1").to route_to("problems#update", room_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rooms/1/problems/1").to route_to("problems#destroy", room_id: "1", id: "1")
    end

  end
end
