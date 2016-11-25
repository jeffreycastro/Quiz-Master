require 'rails_helper'

RSpec.describe "exam_items/new", type: :view do
  before(:each) do
    assign(:exam_item, ExamItem.new(
      :question => "MyText"
    ))
  end

  it "renders new exam_item form" do
    render

    assert_select "form[action=?][method=?]", exam_items_path, "post" do

      assert_select "textarea#exam_item_question[name=?]", "exam_item[question]"
    end
  end
end
