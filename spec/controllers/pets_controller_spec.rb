require 'rails_helper'

describe Api::V1::PetsController do

  user = FactoryGirl.create(:user)
  let(:pet) { FactoryGirl.create(:pet)}
  context 'when user is authenticated' do
    before :each do
      authenticate_headers(request.headers)
    end

      describe "GET index" do
        it 'on success responds with a 200 success status' do

          get :index

          expect(response).to have_http_status(:success)
        end
      end

    describe 'GET show' do
      it 'on success responds with a 200 success status' do
        get :show, id: pet.id

        expect(response).to have_http_status(:success)
      end
    end

  end
end
