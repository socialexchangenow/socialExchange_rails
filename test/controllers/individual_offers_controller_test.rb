require 'test_helper'

class IndividualOffersControllerTest < ActionController::TestCase
  setup do
    @individual_offer = individual_offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:individual_offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create individual_offer" do
    assert_difference('IndividualOffer.count') do
      post :create, individual_offer: { charity_offer_id: @individual_offer.charity_offer_id, individual_id: @individual_offer.individual_id }
    end

    assert_redirected_to individual_offer_path(assigns(:individual_offer))
  end

  test "should show individual_offer" do
    get :show, id: @individual_offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @individual_offer
    assert_response :success
  end

  test "should update individual_offer" do
    patch :update, id: @individual_offer, individual_offer: { charity_offer_id: @individual_offer.charity_offer_id, individual_id: @individual_offer.individual_id }
    assert_redirected_to individual_offer_path(assigns(:individual_offer))
  end

  test "should destroy individual_offer" do
    assert_difference('IndividualOffer.count', -1) do
      delete :destroy, id: @individual_offer
    end

    assert_redirected_to individual_offers_path
  end
end
