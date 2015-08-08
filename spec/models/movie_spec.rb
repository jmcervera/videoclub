require 'rails_helper'

RSpec.describe Movie do
  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:plot) }
  end

  context "scopes" do
    describe "list" do
      before do
        @movie1 = FactoryGirl.create(:movie)
        @movie2 = FactoryGirl.create(:movie)
        @movie3 = FactoryGirl.create(:movie)
      end
      it "returns records ordered by creation desc" do
        expect(Movie.list).to eq [@movie3, @movie2, @movie1]
      end
    end
  end

end
