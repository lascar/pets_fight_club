require 'test_helper'

class PetsControllerTest < ActionController::TestCase
  setup do
    @pet = pets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pets)
  end

  test "should create pet" do
    assert_difference('Pet.count') do
      post :create, pet: { age: @pet.age, name: @pet.name, type: @pet.type, user_id: @pet.user_id, victory_rate: @pet.victory_rate }
    end

    assert_response 201
  end

  test "should show pet" do
    get :show, id: @pet
    assert_response :success
  end

  test "should update pet" do
    put :update, id: @pet, pet: { age: @pet.age, name: @pet.name, type: @pet.type, user_id: @pet.user_id, victory_rate: @pet.victory_rate }
    assert_response 204
  end

  test "should destroy pet" do
    assert_difference('Pet.count', -1) do
      delete :destroy, id: @pet
    end

    assert_response 204
  end
end
