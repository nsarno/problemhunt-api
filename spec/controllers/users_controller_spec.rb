require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  before(:each) do
    @current_user = create :user
    controller.stub(:authenticate) { @current_user }
  end

  describe 'GET #index' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      get :index
      expect(response.status).to eq(401)
    end

    it 'responds with success' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'returns a JSON with the users' do
      create :user
      get :index
      expect(json).to have_key('users')
    end
  end

  describe 'GET #show' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      get :show, id: 42
      expect(response.status).to eq(401)
    end

    context 'with valid id' do
      before :each do
        @user = create :user
        get :show, id: @user
      end

      it 'responds with success' do
        expect(response.status).to eq(200)
      end

      it 'renders the user json' do
        expect(json).to have_key('user')
        expect(json['user']).to have_key('id')
        expect(json['user']).to have_key('email')
      end
    end

    context 'with invalid id' do
      it 'responds with not found' do
        get :show, id: 42
        expect(response.status).to eq(404)
      end
    end
  end
  
  describe 'POST #create' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      post :create, user: attributes_for(:user)
      expect(response.status).to eq(401)
    end

    context 'with valid attributes' do
      before :each do
        post :create, user: attributes_for(:user)
      end
  
      it 'responds with success' do
        expect(response.status).to eq(201)
      end

      it 'saves the new user in the database' do
        expect do
          post :create, user: attributes_for(:user)
        end.to change(User, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      before :each do
        post :create, user: attributes_for(:user, email: nil)
      end

      it 'respond with unprocessabe_entity' do
        expect(response.status).to eq(422)
      end

      it 'does not save the new user in the database' do
        expect do
          post :create, user: attributes_for(:user, email: nil)
        end.to_not change(User, :count)
      end

      it 'renders errors' do
        expect(json).to have_key('email')
      end
    end
  end

  describe 'PUT #update' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      put :update, id: 42, user: attributes_for(:user)
      expect(response.status).to eq(401)
    end

    context 'with valid attributes' do
      before :each do
        @user = create(:user)
        put :update, id: @user, user: attributes_for(:user)
      end

      it 'responds with success' do
        expect(response.status).to eq(204)
      end

      it 'saves the changes in database' do
        put :update, id: @user, user: attributes_for(:user, email: 'foo@bar.com')
        @user.reload
        expect(@user.email).to eq('foo@bar.com')
      end
    end

    context 'with invalid attributes' do
      before :each do
        @user = create(:user)
        put :update, id: @user, user: attributes_for(:user, email: nil)
      end

      it 'responds with unprocessabe_entity' do
        expect(response.status).to eq(422)
      end

      it 'does not save the changes in database' do
        @user.reload
        expect(@user.email).to_not eq(nil)
      end

      it 'renders errors' do
        expect(json).to have_key('email')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      delete :destroy, id: 42
      expect(response.status).to eq(401)
    end

    it 'responds with success' do
      @user = create :user
      delete :destroy, id: @user
      expect(response.status).to eq(204)
    end
  end
end

