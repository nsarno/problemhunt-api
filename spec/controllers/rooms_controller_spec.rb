require 'rails_helper'

RSpec.describe RoomsController, :type => :controller do

  let(:user) { create :user }
  let(:room) { create :room, owner: user }
  let(:not_my_room) { create :room }

  before(:each) do
    controller.stub(:authenticate) { User.current = user }
    controller.stub(:current_user) { user }
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

    it 'can be filtered by name' do
      room1 = create :room
      room2 = create :room
      get :index, { name: room1.name }
      results = json['rooms']
      expect(results.count).to eq(1)
      expect(results.first['name']).to eq(room1.name)
    end
  end

  describe 'GET #show' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      get :show, id: room.id
      expect(response.status).to eq(401)
    end

    it 'responds with success' do
      get :show, id: room.id
      expect(response.status).to eq(200)
    end

    it 'renders the json of the room' do
      get :show, id: room.id
      expect(json).to have_key('room')
    end
  end

  describe 'POST #create' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      post :create, room: attributes_for(:room)
      expect(response.status).to eq(401)
    end

    context 'with valid attributes' do
      before :each do
        post :create, room: attributes_for(:room)
      end

      it 'responds with success' do
        expect(response.status).to eq(201)
      end

      it 'saves the new room in the database' do
        expect do
          post :create, room: attributes_for(:room)
        end.to change(Room, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      before :each do
        post :create, room: attributes_for(:room, name: nil)
      end

      it 'responds with unprocessable entity' do
        expect(response.status).to eq(422)
      end

      it 'does not save the new user in the database' do
        expect do
          post :create, room: attributes_for(:room, name: nil)
        end.to_not change(Room, :count)
      end

      it 'renders errors' do
        expect(json).to have_key('name')
      end
    end
  end

  describe 'PUT #update' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      put :update, id: room.id, room: attributes_for(:room)
      expect(response.status).to eq(401)
    end

    it 'only updates rooms the user owns' do
      put :update, id: not_my_room.id, room: attributes_for(:room)
      expect(response.status).to eq(404)
    end

    context 'with valid attributes' do
      before :each do
        put :update, id: room.id, room: attributes_for(:room, name: 'foo')
        room.reload
      end

      it 'responds with success' do
        expect(response.status).to eq(204)
      end

      it 'saves the changes in database' do
        expect(room.name).to eq('foo')
      end
    end

    context 'with invalid attributes' do
      before :each do
        put :update, id: room.id, room: attributes_for(:room, name: nil)
        room.reload
      end

      it 'responds with unprocessable entity' do
        expect(response.status).to eq(422)
      end

      it 'does not saves the changes in database' do
        expect(room.name).to_not eq(nil)
      end

      it 'renders errors' do
        expect(json).to have_key('name')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'requires authentication' do
      controller.unstub(:authenticate)
      delete :destroy, id: room.id
      expect(response.status).to eq(401)
    end

    it 'responds with success' do
      delete :destroy, id: room.id
      expect(response.status).to eq(204)
    end

    it 'only destroys rooms the user owns' do
      delete :destroy, id: not_my_room.id
      expect(response.status).to eq(404)
    end
  end
end
