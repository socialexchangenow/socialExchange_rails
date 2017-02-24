require 'test_helper'

class CommitmentsControllerTest < ActionController::TestCase
  setup do
    @commitment = commitments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commitments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commitment" do
    assert_difference('Commitment.count') do
      post :create, commitment: { business_counter_offer_id: @commitment.business_counter_offer_id, charity_offer_id: @commitment.charity_offer_id, expectedDate: @commitment.expectedDate, fulfilled: @commitment.fulfilled, fulfilledDate: @commitment.fulfilledDate, individual_id: @commitment.individual_id }
    end

    assert_redirected_to commitment_path(assigns(:commitment))
  end

  test "should show commitment" do
    get :show, id: @commitment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @commitment
    assert_response :success
  end

  test "should update commitment" do
    patch :update, id: @commitment, commitment: { business_counter_offer_id: @commitment.business_counter_offer_id, charity_offer_id: @commitment.charity_offer_id, expectedDate: @commitment.expectedDate, fulfilled: @commitment.fulfilled, fulfilledDate: @commitment.fulfilledDate, individual_id: @commitment.individual_id }
    assert_redirected_to commitment_path(assigns(:commitment))
  end

  test "should destroy commitment" do
    assert_difference('Commitment.count', -1) do
      delete :destroy, id: @commitment
    end

    assert_redirected_to commitments_path
  end
end
