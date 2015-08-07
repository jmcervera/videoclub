require 'rails_helper'

RSpec.feature "Users can edit existing seasons", type: :feature do

  before do
    FactoryGirl.create(:season, title: "Mr. Robot")
    visit admin_seasons_url
    click_link "Mr. Robot"
    click_link "Edit Season"
  end

  scenario "with valid attributes" do
    fill_in "Plot", with: "About a hacker boy"
    click_button "Update Season"

    expect(page).to have_content "Season has been updated."
    expect(page).to have_content "About a hacker boy"
  end

  scenario "with invalid attributes" do
    fill_in "Title", with: ""
    click_button "Update Season"

    expect(page).to have_content "Season has not been updated."
  end
end
