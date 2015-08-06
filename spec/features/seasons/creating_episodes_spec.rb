require 'rails_helper'

RSpec.describe "Users can create new episodes", type: :feature do
  let(:season) { FactoryGirl.create(:season, title: 'Mr. Robot') }
  before do
    visit season_path(season)
    click_link "New Episode"
  end

  scenario "with valid attributes" do
    fill_in "Number", with: 1
    fill_in "Title", with: "Hello Friend"
    fill_in "Plot", with: "Elliot, a cyber-security..."
    click_button "Create Episode"

    episode = season.episodes.find_by(number: 1)
    expect(page.current_url).to eq season_episode_url(season, episode)

    expect(page).to have_content "Episode has been created."
  end

  scenario "with invalid attributes" do
    click_button "Create Episode"
    expect(page).to have_content "Episode has not been created."
  end
end
