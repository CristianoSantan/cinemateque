require 'rails_helper'

describe "Movie Theater API" do
  context "GET api/v1/movie_theaters/1" do
    it "sucessso" do
      movie_theater = FactoryBot.create(:movie_theater, name: 'Cine Paradiso')
      movie_theater.rooms.create(name: 'Sala 01', capacity: 100)

      get "/api/v1/movie_theaters/#{movie_theater.id}"

      expect(response.status).to eq 200 
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response["name"]).to include('Cine Paradiso')
      expect(json_response["city"]).to include('Brasília')
      expect(json_response["rooms"].class).to eq Array
      expect(json_response["rooms"].length).to eq 1
      expect(json_response["rooms"][0]["name"]).to include('Sala 01')
      expect(json_response["rooms"][0]["capacity"]).to eq(100)
      expect(json_response.keys).not_to include('updated_at')
      expect(json_response.keys).not_to include('created_at')
    end
  end
end
