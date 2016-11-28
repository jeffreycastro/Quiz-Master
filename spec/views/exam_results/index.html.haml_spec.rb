require 'rails_helper'

RSpec.describe "exam_results/index", type: :view do
  before(:each) do
    exam = Exam.create(name: "Exam name")
    exam_item = exam.exam_items.create!(question: "Q1", seq_num: 1)
    exam_item.answers.create(content: "A1")
    assign(:exam_results, [
      ExamResult.create!(
        exam_id: exam.id
      ),
      ExamResult.create!(
        exam_id: exam.id
      )
    ])
  end

  it "renders a list of exam_results" do
    render
  end
end
