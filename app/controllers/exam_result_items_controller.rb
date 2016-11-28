class ExamResultItemsController < ApplicationController
  before_action :set_exam_result_item, only: [:submit_answer, :next_question]

  # PUT /exam_result_items/1/submit_answer.js
  def submit_answer
    @exam_result_item.update(exam_result_item_params)
    @correct = @exam_result_item.check_answer(exam_result_item_params[:answer])
    respond_to do |format|
      format.js { render 'exam_results/item_result' }
    end
  end

  # GET /exam_result_items/1/next_question.js
  def next_question
    @exam_result = @exam_result_item.exam_result
    @next_question = @exam_result.exam_result_items.find_by(seq_num: @exam_result_item.seq_num + 1)
    respond_to do |format|
      format.js { render 'exam_results/next_item' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_result_item
      @exam_result_item = ExamResultItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_result_item_params
      params.require(:exam_result_item).permit(:answer, :exam_result_id, :exam_item_id)
    end
end
