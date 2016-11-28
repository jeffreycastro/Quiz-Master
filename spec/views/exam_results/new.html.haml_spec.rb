require 'rails_helper'

RSpec.describe "exam_results/new", type: :view do
  before(:each) do
    assign(:exam_result, ExamResult.new(
      :exam_id => 1
    ))
  end

  it "renders new exam_result form" do
    render

    assert_select "form[action=?][method=?]", exam_results_path, "post" do

      assert_select "input#exam_result_exam_id[name=?]", "exam_result[exam_id]"
    end
  end
end
