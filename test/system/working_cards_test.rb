require "application_system_test_case"

class WorkingCardsTest < ApplicationSystemTestCase
  setup do
    @working_card = working_cards(:one)
  end

  test "visiting the index" do
    visit working_cards_url
    assert_selector "h1", text: "Working Cards"
  end

  test "creating a Working card" do
    visit working_cards_url
    click_on "New Working Card"

    fill_in "Name", with: @working_card.name
    click_on "Create Working card"

    assert_text "Working card was successfully created"
    click_on "Back"
  end

  test "updating a Working card" do
    visit working_cards_url
    click_on "Edit", match: :first

    fill_in "Name", with: @working_card.name
    click_on "Update Working card"

    assert_text "Working card was successfully updated"
    click_on "Back"
  end

  test "destroying a Working card" do
    visit working_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Working card was successfully destroyed"
  end
end
