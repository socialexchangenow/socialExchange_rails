require 'test_helper'

class BusinessCounterOffersControllerTest < ActionController::TestCase
  setup do
    @business_counter_offer = business_counter_offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:business_counter_offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create business_counter_offer" do
    assert_difference('BusinessCounterOffer.count') do
      post :create, business_counter_offer: { amount: @business_counter_offer.amount, business_id: @business_counter_offer.business_id, charity_offer_id: @business_counter_offer.charity_offer_id, longDescription: @business_counter_offer.longDescription, shortCode: @business_counter_offer.shortCode, shortDescription: @business_counter_offer.shortDescription }
    end

    assert_redirected_to business_counter_offer_path(assigns(:business_counter_offer))
  end

  test "should show business_counter_offer" do
    get :show, id: @business_counter_offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @business_counter_offer
    assert_response :success
  end

  test "should update business_counter_offer" do
    patch :update, id: @business_counter_offer, business_counter_offer: { amount: @business_counter_offer.amount, business_id: @business_counter_offer.business_id, charity_offer_id: @business_counter_offer.charity_offer_id, longDescription: @business_counter_offer.longDescription, shortCode: @business_counter_offer.shortCode, shortDescription: @business_counter_offer.shortDescription }
    assert_redirected_to business_counter_offer_path(assigns(:business_counter_offer))
  end

  test "should destroy business_counter_offer" do
    assert_difference('BusinessCounterOffer.count', -1) do
      delete :destroy, id: @business_counter_offer
    end

    assert_redirected_to business_counter_offers_path
  end
end
