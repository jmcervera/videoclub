require 'rails_helper'

RSpec.feature "Users can view seasons", type: :feature do
  scenario "with season details" do
    season = FactoryGirl.create(:season, title: 'Forever')

    visit admin_seasons_url
    click_link "Forever"
    expect(page.current_url).to eq admin_season_url(season)
  end
end
