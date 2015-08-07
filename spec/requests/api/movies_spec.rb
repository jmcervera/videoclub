require 'rails_helper'

RSpec.describe "Movies API", type: :request do

  context "without authorization involvement" do

    before do
      @movies = FactoryGirl.create_list(:movie, 10)
      get api_movies_path
    end

    it "retrieves the movies" do
      expect(response).to be_success
      expect(json['movies'].size).to eq(10)
    end

    it_behaves_like "paginated_array"

    it "retrieves list of movies ordered by creation DESC" do
      db_ids = @movies.map(&:id)
      response_ids = json['movies'].map{|r| r['id']}
      expect(response_ids).to eq(db_ids.reverse)
    end


  end
end
