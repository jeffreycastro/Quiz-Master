require 'rails_helper'

RSpec.describe "exam_items/edit", type: :view do
  before(:each) do
    Exam.create(name: "Exam name")
    @exam_item = assign(:exam_item, ExamItem.create!(
      question: "MyText",
      exam_id: Exam.last.id
    ))
  end

  it "renders the edit exam_item form" do
    render

    assert_select "form[action=?][method=?]", exam_item_path(@exam_item), "post" do

      assert_select "textarea#exam_item_question[name=?]", "exam_item[question]"
    end
  end
end
