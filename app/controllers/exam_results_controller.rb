class ExamResultsController < ApplicationController
  # GET /exam_results/1/take_exam
  def take_exam
    @exam = Exam.find(params[:exam_id])
    @exam_result = @exam.exam_results.create
    @exam_result.create_exam_result_items
    @question = @exam_result.exam_result_items.order('seq_num ASC').first
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_result
      @exam_result = ExamResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_result_params
      params.require(:exam_result).permit(:exam_id)
    end
end
