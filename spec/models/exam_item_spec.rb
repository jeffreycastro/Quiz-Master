require 'rails_helper'

RSpec.describe ExamItem, type: :model do
  context "associations" do
    it { should belong_to(:exam) }
  end

  context "validation" do
    before(:each) do
      Exam.create(name: "Exam name")
    end

    it "requires a question" do
      expect(ExamItem.new(question: nil, exam_id: Exam.last.id)).not_to be_valid
    end

    it "requires an exam parent" do
      expect(ExamItem.new(question: "Question content", exam_id: nil)).not_to be_valid
    end
  end
end
