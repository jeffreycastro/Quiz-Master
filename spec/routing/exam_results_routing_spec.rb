require "rails_helper"

RSpec.describe ExamResultsController, type: :routing do
  describe "routing" do
    it "routes to #take_exam via GET" do
      expect(:get => "/exam_results/take_exam").to route_to("exam_results#take_exam")
    end
  end
end
