require 'rails_helper'

RSpec.describe "Seasons API", type: :request do

  context "without authorization involvement" do

    before do
      @seasons = FactoryGirl.create_list(:season, 3)
      @seasons.each do |season|
        FactoryGirl.create_list(:episode, 10, season: season)
      end
      get api_seasons_path
    end

    it "retrieves the seasons" do
      expect(response).to be_success
      expect(json['seasons'].size).to eq(3)
    end

    it "retrieves list of seasons ordered by creation DESC" do
      db_ids = @seasons.map(&:id)
      response_ids = json['seasons'].map{|r| r['id']}
      expect(response_ids).to eq(db_ids.reverse)
    end

    it "retrieves all the episodes of each season ordered by number" do
      json['seasons'].each do |season|
        episodes = season['episodes']
        numbers = episodes.map{|e| e['number']}
        expect(numbers).to eq(numbers.sort)
      end
    end
  end
end
