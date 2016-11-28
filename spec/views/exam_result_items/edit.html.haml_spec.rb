require 'rails_helper'

RSpec.describe "exam_result_items/edit", type: :view do
  before(:each) do
    exam = Exam.create(name: "Exam name")
    exam_item = exam.exam_items.create!(question: "Q1", seq_num: 1)
    exam_item.answers.create(content: "A1")
    @exam_result = exam.exam_results.create
    @exam_result_item = assign(:exam_result_item, ExamResultItem.create!(exam_result_id: @exam_result.id, exam_item_id: exam_item.id))
  end

  it "renders the edit exam_result_item form" do
    render

    assert_select "form[action=?][method=?]", exam_result_item_path(@exam_result_item), "post" do
    end
  end
end
