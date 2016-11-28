require "rails_helper"

RSpec.describe ExamResultItemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/exam_result_items").to route_to("exam_result_items#index")
    end

    it "routes to #new" do
      expect(:get => "/exam_result_items/new").to route_to("exam_result_items#new")
    end

    it "routes to #show" do
      expect(:get => "/exam_result_items/1").to route_to("exam_result_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/exam_result_items/1/edit").to route_to("exam_result_items#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/exam_result_items").to route_to("exam_result_items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/exam_result_items/1").to route_to("exam_result_items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/exam_result_items/1").to route_to("exam_result_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/exam_result_items/1").to route_to("exam_result_items#destroy", :id => "1")
    end

  end
end
