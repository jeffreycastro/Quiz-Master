require 'rails_helper'

RSpec.describe ExamResult, type: :model do
  context "associations" do
    it { should belong_to(:exam ) }
    it { should have_many(:exam_result_items) }
  end

  context "methods" do
    before(:each) do
      @exam = Exam.create(name: "Exam name")
      exam_item = @exam.exam_items.create!(question: "Q1", seq_num: 1)
      exam_item.answers.create(content: "A1")
      @exam.reload
    end
    
    context "#create_exam_result_items" do
      it "creates exam_result_item records from exam_items" do
        @exam_result = @exam.exam_results.create
        expect{
          @exam_result.create_exam_result_items
          @exam_result.reload
        }.to change(ExamResultItem, :count).by(1)
      end
    end

    context "#total_score" do
      it "returns the count of exam_result_items" do
        @exam_result = @exam.exam_results.create
        @exam_result.create_exam_result_items
        @exam_result.reload
        expect(@exam_result.total_score).to eq(1)
      end
    end
  end
end
