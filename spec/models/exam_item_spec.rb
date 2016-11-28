require 'rails_helper'

RSpec.describe ExamItem, type: :model do
  context "associations" do
    it { should belong_to(:exam) }
    it { should have_many(:answers) }
    it { should accept_nested_attributes_for(:answers) }
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

  context "methods" do
    context "#set_sequence_number" do
      it "returns the seq_num next to the latest exam_item in the exam" do
        exam = Exam.create(name: "Exam name")
        exam_item = exam.exam_items.create!(question: "Q1", seq_num: 1)
        exam.reload
        new_exam_item = exam.exam_items.create!(question: "Q2")
        exam.reload
        expect(new_exam_item.seq_num).to eq(2)
      end
    end
  end
end
