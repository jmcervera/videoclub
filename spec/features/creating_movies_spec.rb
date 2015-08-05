require 'rails_helper'

RSpec.feature "Users can create new movies", type: :feature do
  scenario "with valid attributes" do
    visit "/"
    click_link "New Movie"

    fill_in "Title", with: "300: Rise of an Empire"
    fill_in "Plot", with: "Story of the battle of Thermopylae in 480 B.C."

    click_button "Create Movie"

    expect(page).to have_content "Movie has been created."
  end

end
