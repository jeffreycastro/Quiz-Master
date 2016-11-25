require 'rails_helper'

RSpec.describe "exam_items/show", type: :view do
  before(:each) do
    Exam.create(name: "Exam name")
    @exam_item = assign(:exam_item, ExamItem.create!(
      question: "MyText",
      exam_id: Exam.last.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
