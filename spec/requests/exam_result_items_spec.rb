require 'rails_helper'

RSpec.describe "ExamResultItems", type: :request do
  describe "GET /exam_result_items" do
    it "works! (now write some real specs)" do
      get exam_result_items_path
      expect(response).to have_http_status(200)
    end
  end
end
