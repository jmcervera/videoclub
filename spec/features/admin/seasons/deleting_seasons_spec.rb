require 'rails_helper'

RSpec.feature "Users can delete seasons", type: :feature do
  scenario "with success" do
    FactoryGirl.create(:season, title: "Forever")
    visit admin_seasons_path
    click_link "Forever"
    click_link "Delete Season"

    expect(page).to have_content "Season has been deleted."
    expect(page.current_url).to eq admin_seasons_url
    expect(page).to have_no_content "Forever"
  end
end
