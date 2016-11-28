require 'rails_helper'

RSpec.describe "exam_result_items/new", type: :view do
  before(:each) do
    assign(:exam_result_item, ExamResultItem.new())
  end

  it "renders new exam_result_item form" do
    render

    assert_select "form[action=?][method=?]", exam_result_items_path, "post" do
    end
  end
end
