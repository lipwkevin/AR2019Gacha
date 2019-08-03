require 'test_helper'

class WorkingCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @working_card = working_cards(:one)
  end

  test "should get index" do
    get working_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_working_card_url
    assert_response :success
  end

  test "should create working_card" do
    assert_difference('WorkingCard.count') do
      post working_cards_url, params: { working_card: { name: @working_card.name } }
    end

    assert_redirected_to working_card_url(WorkingCard.last)
  end

  test "should show working_card" do
    get working_card_url(@working_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_working_card_url(@working_card)
    assert_response :success
  end

  test "should update working_card" do
    patch working_card_url(@working_card), params: { working_card: { name: @working_card.name } }
    assert_redirected_to working_card_url(@working_card)
  end

  test "should destroy working_card" do
    assert_difference('WorkingCard.count', -1) do
      delete working_card_url(@working_card)
    end

    assert_redirected_to working_cards_url
  end
end
