require 'rails_helper'

RSpec.feature "Users can edit existing movies", type: :feature do

  before do
    FactoryGirl.create(:movie, title: "Star Wars")
    visit movies_url
    click_link "Star Wars"
    click_link "Edit Movie"
  end

  scenario "with valid attributes" do
    fill_in "Plot", with: "A long time ago in a galaxy far, far away..."
    click_button "Update Movie"

    expect(page).to have_content "Movie has been updated."
    expect(page).to have_content "A long time ago in a galaxy far, far away..."
  end

  scenario "with invalid attributes" do
    fill_in "Title", with: ""
    click_button "Update Movie"

    expect(page).to have_content "Movie has not been updated."

  end
end
