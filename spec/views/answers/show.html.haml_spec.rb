require 'rails_helper'

RSpec.describe "answers/show", type: :view do
  before(:each) do
    exam = Exam.create!(name: "Exam name")
    exam.exam_items.create!(question: "Q1")

    @answer = assign(:answer, Answer.create!(
      content: "Content",
      exam_item_id: ExamItem.last.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Content/)
  end
end
