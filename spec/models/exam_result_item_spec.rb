require 'rails_helper'

RSpec.describe ExamResultItem, type: :model do
  context "associations" do
    it { should belong_to(:exam_result) }
    it { should belong_to(:exam_item) }
  end

  context "methods" do
    context "#check_answer(given_answer)" do
      before(:each) do
        exam = Exam.create(name: "Exam name")
        exam_item = exam.exam_items.create!(question: "Q1", seq_num: 1)
        exam_item.answers.create(content: "A1")

        @exam_result = exam.exam_results.create
        @exam_result_item = ExamResultItem.create(exam_result_id: @exam_result.id, exam_item_id: exam_item.id)
      end

      context "answer is incorrect" do
        it "returns false if answer is incorrect" do
          expect(@exam_result_item.check_answer("A2")).to eq(false)
        end
      end

      context "answer is correct" do
        it "returns true if answer is correct" do
          expect(@exam_result_item.check_answer("A1")).to eq(true)
        end

        it "updates the is_correct value to true" do
          @exam_result_item.check_answer("A1")
          @exam_result_item.reload
          expect(@exam_result_item.is_correct).to eq(true)
        end

        it "increments the exam_result score by 1" do
          expect{
            @exam_result_item.check_answer("A1")
            @exam_result.reload
          }.to change(@exam_result, :score).by(1)
        end
      end
    end
  end
end
