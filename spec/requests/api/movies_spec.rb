require 'rails_helper'

RSpec.describe "Movies API", type: :request do


  context "without authorization involvement" do

    before do
      @movies = FactoryGirl.create_list(:movie, 10)
    end

    it "retrieves list of movies ordered by creation DESC" do
      get api_movies_path
      expect(response).to be_success

      expect(json['movies'].size).to eq(10)

      db_ids = @movies.map(&:id)
      response_ids = json['movies'].map{|r| r['id']}
      expect(response_ids).to eq(db_ids.reverse)

    end
  end
end
