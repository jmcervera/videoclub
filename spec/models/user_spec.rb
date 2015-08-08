require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of :email }
  it { is_expected.to have_many(:purchases) }

  describe "#library" do
    let(:user) { FactoryGirl.create(:user)}
    let(:item1) { FactoryGirl.create(:movie)}
    let(:item2) { FactoryGirl.create(:season)}

    before do

      user.purchases.create(item: item1,
        purchased_at: 5.days.ago,
        expire_at: 3.days.ago)

      user.purchases.create(item: item2,
        purchased_at: Time.current,
        expire_at: Time.current + 2.days)

    end
    it "returns all alive items for the user" do
      expect(user.library).to eq [item2]
    end

  end
end
