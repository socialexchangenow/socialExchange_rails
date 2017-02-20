require 'test_helper'

class CharityOffersControllerTest < ActionController::TestCase
  setup do
    @charity_offer = charity_offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:charity_offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create charity_offer" do
    assert_difference('CharityOffer.count') do
      post :create, charity_offer: { amount: @charity_offer.amount, charity_id: @charity_offer.charity_id, longDescription: @charity_offer.longDescription, shortCode: @charity_offer.shortCode, shortDescription: @charity_offer.shortDescription }
    end

    assert_redirected_to charity_offer_path(assigns(:charity_offer))
  end

  test "should show charity_offer" do
    get :show, id: @charity_offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @charity_offer
    assert_response :success
  end

  test "should update charity_offer" do
    patch :update, id: @charity_offer, charity_offer: { amount: @charity_offer.amount, charity_id: @charity_offer.charity_id, longDescription: @charity_offer.longDescription, shortCode: @charity_offer.shortCode, shortDescription: @charity_offer.shortDescription }
    assert_redirected_to charity_offer_path(assigns(:charity_offer))
  end

  test "should destroy charity_offer" do
    assert_difference('CharityOffer.count', -1) do
      delete :destroy, id: @charity_offer
    end

    assert_redirected_to charity_offers_path
  end
end
