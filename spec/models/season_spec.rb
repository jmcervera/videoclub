require 'rails_helper'

RSpec.describe Season, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:plot) }
  end

  context "scopes" do
    describe "list" do
      before do
        @season1 = FactoryGirl.create(:season)
        @season2 = FactoryGirl.create(:season)
        @season3 = FactoryGirl.create(:season)

        @episode1 = FactoryGirl.create(:episode, number: 3, season: @season1)
        @episode2 = FactoryGirl.create(:episode, number: 1, season: @season1)
        @episode3 = FactoryGirl.create(:episode, number: 2, season: @season1)

      end
      it "returns records ordered by creation desc" do
        expect(Season.list).to eq [@season3, @season2, @season1]
      end
    end
  end
end
