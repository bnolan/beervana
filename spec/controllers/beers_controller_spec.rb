require 'rails_helper'

# Sorry, half of this stuff should be in the model.
# Trying to rush something out the door.

RSpec.describe BeersController, type: :controller do
  let(:user)   { users(:ben) }
  let(:result) { JSON.parse(response.body) }

  def expect_json_result
    expect(response).to be_success
    expect(response.content_type).to eq "application/json"
  end

  describe "#index" do
    def beer_by_name(name)
      result.detect {|beer| beer["name"] == name}
    end

    let(:smelly_result) { beer_by_name("Smelly Supreme") }
    let(:gross_result)  { beer_by_name("Gross Beer") }

    def expect_json_array_result
      expect_json_result
      expect(result).to be_an Array
    end

    context "without a sort_by" do
      context "when the beers haven't been rated" do
        it "gets a list of beers" do
          get :index, format: "json"
          expect_json_array_result

          expect(result.length).to eq Beer.count

          expect(smelly_result).to_not be nil
          expect(smelly_result["brewery_name"]).to eq "Dumb Breweries"
          expect(smelly_result["average_rating"]).to eq 3 # the default
          expect(smelly_result["controversiality"]).to eq 0 # also the default
          expect(smelly_result["abv"]).to eq "32.1"
          expect(smelly_result["style"]).to eq "clumpy"
          expect(smelly_result["details"]).to include "you can't get"
          expect(smelly_result["hops"]).to eq "none"
          expect(smelly_result["location"]).to eq "on top of the stereo"
        end
      end

      context "when the beers have been rated" do
        before do
          {:smelly => 2, :gross => 5}.each do |beer, rating|
            user.drinks.create!(beer: beers(beer), rating: rating, volume: 1)
          end
        end

        it "gets a list of beers by average rating" do
          get :index, format: "json"
          expect_json_array_result

          expect(result.first["name"]).to eq "Gross Beer"
          expect(result.last["name"]).to eq "Smelly Supreme"
        end
      end
    end

    context "sorting by 'abv'" do
      it "gets a list of beers sorted by abv" do
        get :index, format: "json", sort_by: "abv"
        expect_json_array_result

        expect(result.index(smelly_result)).to be < result.index(gross_result)
      end
    end

    context "sorting by 'name'" do
      it "gets a list of beers sorted by name" do
        get :index, format: "json", sort_by: "name"
        expect_json_array_result

        expect(result.index(smelly_result)).to be > result.index(gross_result)
      end
    end

    context "sorting by 'controversiality'" do
      it "returns all the beers" do
        get :index, format: "json", sort_by: "controversiality"
        expect_json_array_result

        expect(result.length).to eq Beer.count
      end

      it "sorts by controversiality"
    end
  end

  describe "#show" do
    before do
      users(:roger).drinks.create!(beer: beers(:smelly), rating: 4, volume: 1, notes: "tastes like beer")
      users(:ben).drinks.create!(beer: beers(:smelly), rating: 2, volume: 1)
    end

    it "gets detailed information for the given beer" do
      get :show, format: "json", id: beers(:smelly)
      expect_json_result

      expect(result).to include(
        "name"=>"Smelly Supreme", "brewery_name"=>"Dumb Breweries", "average_rating"=>3.0, "controversiality"=>0.0, "drink_count"=>2, "abv"=>"32.1", "ibu"=>nil, "style"=>"clumpy", "details"=>"Smelly Supreme: you can't get smellier", "hops"=>"none", "location"=>"on top of the stereo"
      )
      expect(result["drinks"].length).to eq 2

      drinks = result["drinks"].sort_by {|drink| drink["id"]}
      roger = drinks.first
      expect(roger["volume"]).to eq 1
      expect(roger["rating"]).to eq 4
      expect(roger["notes"]).to eq "tastes like beer"
      expect(roger["user"]["name"]).to eq "Roger Nesbitt"
    end
  end
end
