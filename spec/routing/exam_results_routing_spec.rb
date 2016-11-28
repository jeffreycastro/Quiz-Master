require "rails_helper"

RSpec.describe ExamResultsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/exam_results").to route_to("exam_results#index")
    end

    it "routes to #new" do
      expect(:get => "/exam_results/new").to route_to("exam_results#new")
    end

    it "routes to #show" do
      expect(:get => "/exam_results/1").to route_to("exam_results#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/exam_results/1/edit").to route_to("exam_results#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/exam_results").to route_to("exam_results#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/exam_results/1").to route_to("exam_results#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/exam_results/1").to route_to("exam_results#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/exam_results/1").to route_to("exam_results#destroy", :id => "1")
    end

  end
end
