require 'rails_helper'

RSpec.describe "Items API", type: :request do

  context "without authorization involvement" do

    before do
      @items = []
      5.times do
        @items << FactoryGirl.create_list(:movie, 2)
        @items << FactoryGirl.create_list(:season, 2)
      end
      @items.flatten!
      get api_items_path
    end

    it "retrieves the movies and the seasons together" do
      expect(response).to be_success

      key = root_name(json)
      expect(json[key].size).to eq(20)
    end

    it_behaves_like "paginated_array"

    it "retrieves list of items ordered by creation DESC" do
      key = root_name(json)
      db_ids = @items.map(&:id)
      response_ids = json[key].map{|r| r['id']}
      expect(response_ids).to eq(db_ids.reverse)
    end

  end
end
