require 'rails_helper'

RSpec.describe Item do
  context "scopes" do
    describe "list" do
      before do
        @item1 = FactoryGirl.create(:movie)
        @item2 = FactoryGirl.create(:season)
        @item3 = FactoryGirl.create(:season)
      end
      it "returns records ordered by creation desc" do
        expect(Item.list).to eq [@item3, @item2, @item1]
      end
    end
  end
end
