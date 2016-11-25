require 'rails_helper'

RSpec.describe Answer, type: :model do
  context "associations" do
    it { should belong_to(:exam_item) }
  end

  context "validation" do
    before(:each) do
      exam = Exam.create!(name: "Exam name")
      exam.exam_items.create!(question: "Q1")
    end

    it "requires a content" do
      expect(Answer.new(content: nil, exam_item_id: ExamItem.last.id)).not_to be_valid
    end

    it "requires an exam_item parent" do
      expect(Answer.new(content: "Sample answer", exam_item_id: nil)).not_to be_valid
    end
  end
end
