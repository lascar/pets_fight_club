require 'rails_helper'

describe Api::V1::PetsController do

  let(:pet_resource) {{id:1, name: "the pet"}}
  let(:valid_update_params) { valid_create_params.merge(id: 1) }
  context 'when user is authenticated' do
    before :each do
      authenticate_headers(request.headers)
    end

      describe "GET index" do
        it 'on success responds with a 200 success status' do
          get action, index_params

          expect(response).to have_http_status(:success)
        end
      end

    describe 'GET show' do
      it 'on success responds with a 200 success status' do
        get :show, id: pet_resource.id

        expect(response).to have_http_status(:success)
      end
    end

  end
end
