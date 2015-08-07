require 'rails_helper'

RSpec.feature "Users can add seasons", type: :feature do
  before do
    # visit "/"
    # click_link "Seasons"
    visit seasons_url
    click_link "New Season"
  end

  scenario "with valid Attributes" do
    fill_in "Title", with: "Mr. Robot"
    fill_in "Plot", with: "Like the Fight Club for programmers"

    click_button "Create Season"

    expect(page).to have_content "Season has been created."

    season = Season.find_by(title: "Mr. Robot")
    expect(page.current_url).to eq season_url(season)

    title = "Mr. Robot - Videoclub"
    expect(page).to have_title title
  end

  scenario "with invalid attributes" do
    click_button "Create Season"
    expect(page).to have_content "Season has not been created."
    expect(page).to have_content "Title can't be blank"
  end

end
