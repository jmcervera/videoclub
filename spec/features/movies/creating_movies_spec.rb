require 'rails_helper'

RSpec.feature "Users can create new movies", type: :feature do
  before do
    visit "/"
    click_link "Movies"
    click_link "New Movie"
  end

  scenario "with valid attributes" do
    fill_in "Title", with: "300: Rise of an Empire"
    fill_in "Plot", with: "Story of the battle of Thermopylae in 480 B.C."

    click_button "Create Movie"

    expect(page).to have_content "Movie has been created."

    movie = Movie.find_by(title: "300: Rise of an Empire")
    expect(page.current_url).to eq movie_url(movie)

    title = "300: Rise of an Empire - Videoclub"
    expect(page).to have_title title
  end

  scenario "with invalid attributes" do
    click_button "Create Movie"
    expect(page).to have_content "Movie has not been created."
    expect(page).to have_content "Title can't be blank"
  end

end
