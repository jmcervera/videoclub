require 'rails_helper'

RSpec.feature "Users can view movies", type: :feature do
  scenario "with movie details" do
    movie = FactoryGirl.create(:movie, title: 'Lord of the Rings')

    visit movies_url
    click_link "Lord of the Rings"
    expect(page.current_url).to eq movie_url(movie)
  end
end
