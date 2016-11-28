require 'rails_helper'

RSpec.describe "ExamResults", type: :request do
  describe "GET /exam_results" do
    it "works! (now write some real specs)" do
      get exam_results_path
      expect(response).to have_http_status(200)
    end
  end
end
