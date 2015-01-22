require "rails_helper"

RSpec.describe RegistrationsController, :type => :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/rooms/1/follow").to route_to("registrations#create", id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rooms/1/unfollow").to route_to("registrations#destroy", id: "1")
    end

  end
end
