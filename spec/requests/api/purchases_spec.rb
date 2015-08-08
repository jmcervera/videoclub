require 'rails_helper'

RSpec.describe "Purchase API" do
  let(:user) { FactoryGirl.create(:user) }
  let(:movie) { FactoryGirl.create(:movie) }

  describe "User performs a purchase of new content" do

    context "with valid attributes" do
      before do
        post api_user_purchases_path(user), item_id: movie.id
      end

      it "is expected to be created" do
        expect(response.status).to eq 201
      end

      it "returns the json object for the purchase" do
        expect(json['purchase']['item_id']).to eq(movie.id)
      end
    end
  end

  describe "User tries to purchase an item that it is still live in his library" do
    let!(:previous_purchase) {
      FactoryGirl.create(:purchase, user: user, item: movie,
        purchased_at: 1.day.ago, expire_at: 1.day.from_now)
    }

    before do
      post api_user_purchases_path(user), item_id: movie.id
    end

    it "is expected not to be created" do
      expect(response.status).to eq 422
    end

    it "returns json errors" do
      message = "You have that already in your library"
      expect(json['text']).to eq message
    end

  end

end
