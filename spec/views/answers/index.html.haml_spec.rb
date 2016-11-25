require 'rails_helper'

RSpec.describe "answers/index", type: :view do
  before(:each) do
    exam = Exam.create!(name: "Exam name")
    exam.exam_items.create!(question: "Q1")

    assign(:answers, [
      Answer.create!(
        content: "Content",
        exam_item_id: ExamItem.last.id
      ),
      Answer.create!(
        content: "Content",
        exam_item_id: ExamItem.last.id
      )
    ])
  end

  it "renders a list of answers" do
    render
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
