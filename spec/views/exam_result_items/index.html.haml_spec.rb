require 'rails_helper'

RSpec.describe "exam_result_items/index", type: :view do
  before(:each) do
  	exam = Exam.create(name: "Exam name")
    exam_item = exam.exam_items.create!(question: "Q1", seq_num: 1)
    exam_item.answers.create(content: "A1")
    @exam_result = exam.exam_results.create

    assign(:exam_result_items, [
      ExamResultItem.create!(exam_result_id: @exam_result.id, exam_item_id: exam_item.id),
    ])
  end

  it "renders a list of exam_result_items" do
    render
  end
end
