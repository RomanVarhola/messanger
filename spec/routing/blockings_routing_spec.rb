require "rails_helper"

RSpec.describe BlockingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/blockings").to route_to("blockings#index")
    end

    it "routes to #new" do
      expect(:get => "/blockings/new").to route_to("blockings#new")
    end

    it "routes to #show" do
      expect(:get => "/blockings/1").to route_to("blockings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/blockings/1/edit").to route_to("blockings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/blockings").to route_to("blockings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/blockings/1").to route_to("blockings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/blockings/1").to route_to("blockings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/blockings/1").to route_to("blockings#destroy", :id => "1")
    end

  end
end
