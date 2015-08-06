require 'rails_helper'

RSpec.describe SeasonsController, type: :controller do
  it "handles a missing season correctly" do
    get :show, id: 'not-found'
    expect(response).to redirect_to(seasons_path)
    message = "The season you were looking for could not be found."
    expect(flash[:alert]).to eq message
  end
end
