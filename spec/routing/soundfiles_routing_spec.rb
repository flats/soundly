require "rails_helper"

RSpec.describe SoundfilesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/soundfiles").to route_to("soundfiles#index")
    end

    it "routes to #new" do
      expect(:get => "/soundfiles/new").to route_to("soundfiles#new")
    end

    it "routes to #show" do
      expect(:get => "/soundfiles/1").to route_to("soundfiles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/soundfiles/1/edit").to route_to("soundfiles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/soundfiles").to route_to("soundfiles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/soundfiles/1").to route_to("soundfiles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/soundfiles/1").to route_to("soundfiles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/soundfiles/1").to route_to("soundfiles#destroy", :id => "1")
    end

  end
end
