require 'rails_helper'

RSpec.describe OrganizationsController, :type => :controller do

  describe "GET index" do
    it 'responds with success' do
      get :index
      expect(response.status).to eq(200)
    end
  end

end
