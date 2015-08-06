require 'rails_helper'

RSpec.feature "Users can delete movies", type: :feature do
  scenario "with success" do
    FactoryGirl.create(:movie, title: "Star Wars")
    visit movies_url
    click_link "Star Wars"
    click_link "Delete Movie"

    expect(page).to have_content "Movie has been deleted."
    expect(page.current_url).to eq movies_url
    expect(page).to have_no_content "Star Wars"
  end
end
