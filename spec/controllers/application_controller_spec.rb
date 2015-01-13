require 'rails_helper'

RSpec.describe ApplicationController, :type => :controller do

  describe 'GET #index' do
    it 'responds with success' do
      expect(response.status).to eq(200)
    end
  end

end
