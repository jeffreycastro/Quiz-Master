require 'rails_helper'

RSpec.describe "answers/edit", type: :view do
  before(:each) do
    exam = Exam.create!(name: "Exam name")
    exam.exam_items.create!(question: "Q1")

    @answer = assign(:answer, Answer.create!(
      content: "MyString",
      exam_item_id: ExamItem.last.id
    ))
  end

  it "renders the edit answer form" do
    render

    assert_select "form[action=?][method=?]", answer_path(@answer), "post" do

      assert_select "input#answer_content[name=?]", "answer[content]"
    end
  end
end
