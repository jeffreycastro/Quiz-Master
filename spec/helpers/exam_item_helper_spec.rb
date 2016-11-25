require "rails_helper"

describe ExamItemHelper do
  describe "#possible_answers_display" do
    it "returns the formatted answers for the exam_item" do
      exam = Exam.create!(name: "Exam name")
      exam_item = exam.exam_items.create!(question: "Q1")
      exam_item.answers.create!(content: "A1")
      exam_item.answers.create!(content: "A2")

      expect(helper.possible_answers_display(exam_item)).to eq("A1<br/>A2")
    end
  end
end