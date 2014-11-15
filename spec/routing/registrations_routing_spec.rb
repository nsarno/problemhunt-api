require "rails_helper"

RSpec.describe RegistrationsController, :type => :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/rooms/1/registrations").to route_to("registrations#create", room_id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rooms/1/registrations/1").to route_to("registrations#destroy", room_id: "1", id: "1")
    end

  end
end
