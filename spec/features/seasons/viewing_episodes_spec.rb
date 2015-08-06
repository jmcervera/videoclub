require 'rails_helper'

RSpec.describe "Users can view episodes" do

  let!(:season) { FactoryGirl.create(:season, title: 'Mr. Robot')}
  let!(:episode1) { FactoryGirl.create(:episode,
    number: 1, title: "Hello Friend", season: season)}
  let!(:episode2) { FactoryGirl.create(:episode,
    number: 2, title: "Ones and Zer0es", season: season)}

  before do
    visit seasons_path
  end

  scenario "for a given season" do
    click_link "Mr. Robot"
    expect(page).to have_content "Hello Friend"
    expect(page).to have_content "Ones and Zer0es"

    click_link "1 - Hello Friend"
    within("#episode h2") do
      expect(page).to have_content "Hello Friend"
    end
  end

end
