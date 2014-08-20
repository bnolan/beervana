require 'rails_helper'

RSpec.describe DrinksController, type: :controller do
  let(:result) { JSON.parse(response.body) }

  def expect_json_result
    expect(response).to be_success
    expect(response.content_type).to eq "application/json"
  end

  describe "#create" do
    it "should create" do
      expect {
        post :create, :username => "ben", :password => "password", :drink => { :beer_id => beers(:gross).id, :notes => "Nothing", :rating => 3, :volume => 100 }, :format => :json
      }.to change(Drink, :count).by(1)
      expect_json_result
    end

    it "should create with bad proguard-mangled parameters" do
      expect {
        post :create, :a => "ben", :b => "password", :c => { :beer_id => beers(:gross).id, :rating => 2, :notes => "Nothing", :volume => 200 }, :format => :json
      }.to change(Drink, :count).by(1)
      expect_json_result
    end
  end
end
