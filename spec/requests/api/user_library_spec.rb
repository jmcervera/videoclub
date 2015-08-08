require 'rails_helper'


RSpec.describe "API Endpoint to get the library of a user" do
  let(:user) { FactoryGirl.create(:user)}
  let(:item1) { FactoryGirl.create(:movie)}
  let(:item2) { FactoryGirl.create(:movie)}
  let(:item3) { FactoryGirl.create(:season)}
  let(:item4) { FactoryGirl.create(:season)}

  before do
    FactoryGirl.create(:purchase, item: item4, user: user,
      purchased_at: 15.days.ago, expire_at: 13.days.ago)

    FactoryGirl.create(:purchase, item: item3, user: user,
      purchased_at: 1.day.ago, expire_at: 1.day.from_now)

    FactoryGirl.create(:purchase, item: item1, user: user,
      purchased_at: Time.current, expire_at: 2.days.from_now)

    FactoryGirl.create(:purchase, item: item2, user: user,
      purchased_at: Time.current, expire_at: 2.days.from_now)

    get api_user_library_path(user)
  end

  it "returns the library ordered by time left to watch the content" do
    key = root_name(json)
    expect(json[key].map{|i| i['id']}).to eq [item3, item1, item2].map(&:id)
  end


end
