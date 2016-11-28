require 'rails_helper'

RSpec.describe "exam_results/edit", type: :view do
  before(:each) do
    exam = Exam.create(name: "Exam name")
    exam_item = exam.exam_items.create!(question: "Q1", seq_num: 1)
    exam_item.answers.create(content: "A1")
    @exam_result = assign(:exam_result, ExamResult.create!(
      exam_id: exam.id
    ))
  end

  it "renders the edit exam_result form" do
    render

    assert_select "form[action=?][method=?]", exam_result_path(@exam_result), "post" do

      assert_select "input#exam_result_exam_id[name=?]", "exam_result[exam_id]"
    end
  end
end
