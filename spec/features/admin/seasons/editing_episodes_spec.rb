require 'rails_helper'

RSpec.describe "Users can edit episodes", type: :feature do

  let(:season) { FactoryGirl.create(:season, title: 'Mr. Robot') }
  let(:episode) { FactoryGirl.create(:episode, season: season)}

  before do
    visit admin_season_episode_path(season, episode)
    click_link "Edit Episode"
  end

  scenario "with valid attributes" do
    fill_in "Title", with: "Hello Friend"
    click_button "Update Episode"

    expect(page).to have_content "Episode has been updated."

    within("#episode h2") do
      expect(page).to have_content "Hello Friend"
      expect(page).not_to have_content episode.title
    end
  end

  scenario "with invalid attributes" do
    fill_in "Title", with: ""
    click_button "Update Episode"
    expect(page).to have_content "Episode has not been updated."
  end
end
