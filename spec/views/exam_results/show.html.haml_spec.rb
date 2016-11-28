require 'rails_helper'

RSpec.describe "exam_results/show", type: :view do
  before(:each) do
    exam = Exam.create(name: "Exam name")
    exam_item = exam.exam_items.create!(question: "Q1", seq_num: 1)
    exam_item.answers.create(content: "A1")
    @exam_result = assign(:exam_result, ExamResult.create!(
      exam_id: exam.id
    ))
  end

  it "renders attributes in <p>" do
    render
  end
end
