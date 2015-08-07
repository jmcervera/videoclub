require 'rails_helper'

RSpec.feature "Users can delete episodes", type: :feature do
  let(:season) { FactoryGirl.create(:season, title: 'Mr. Robot') }
  let(:episode) { FactoryGirl.create(:episode, season: season)}
  scenario "with success" do
    visit admin_season_episode_path(season, episode)
    click_link "Delete Episode"

    expect(page).to have_content "Episode has been deleted."
    expect(page.current_url).to eq admin_season_url(season)
  end
end
