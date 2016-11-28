require "rails_helper"

RSpec.describe ExamResultItemsController, type: :routing do
  describe "routing" do
    it "routes to #submit_answer via PUT" do
      expect(:put => "/exam_result_items/1/submit_answer").to route_to("exam_result_items#submit_answer", :id => "1")
    end

    it "routes to #next_question via GET" do
      expect(:get => "/exam_result_items/1/next_question").to route_to("exam_result_items#next_question", :id => "1")
    end
  end
end
