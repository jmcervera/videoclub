require 'rails_helper'

RSpec.describe "Users visit Home Page" do
  scenario "see our welcome page" do
    visit "/"
    expect(page).to have_content "Welcome to Videoclub"
  end

end
