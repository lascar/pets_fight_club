require 'rails_helper'

describe Api::V1::RobotsController do

  let(:robot) { FactoryGirl.create(:robot, user: user)}
  context 'when user is not authenticated' do
    describe "GET index" do
      it 'responds with a 401 error status' do

        get :index, :format => :json

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
  
  context 'when user is authenticated' do
    let(:user) { FactoryGirl.create(:user) }
    let!(:robot) {FactoryGirl.create('robot', user: user)}
    before :each do
      authenticate_headers(request.headers)
    end

      describe "GET index" do
        it 'on success responds with a 200 success status' do

          get :index

          expect(response).to have_http_status(:success)
        end

        it 'obtains a list of the items' do
          expected_user_email = user.email
          get :index
          expect(JSON.parse(response.body)['robots'].last['user']['email']).to eq(expected_user_email)
          expect(JSON.parse(response.body)['robots'].count).to eq(1)
        end
      end

    describe 'GET show' do
      it 'on success responds with a 200 success status' do
        get :show, id: robot.id

        expect(response).to have_http_status(:success)
      end
    end

  end
end
