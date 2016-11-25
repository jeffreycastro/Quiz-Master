require 'rails_helper'

RSpec.describe "exam_items/index", type: :view do
  before(:each) do
    Exam.create(name: "Exam name")
    assign(:exam_items, [
      ExamItem.create!(
        question: "MyText",
        exam_id: Exam.last.id
      ),
      ExamItem.create!(
        question: "MyText",
        exam_id: Exam.last.id
      )
    ])
  end

  it "renders a list of exam_items" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
