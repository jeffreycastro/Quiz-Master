class ExamResultItemsController < ApplicationController
  before_action :set_exam_result_item, only: [:show, :edit, :update, :destroy, :submit_answer, :next_question]

  # GET /exam_result_items
  # GET /exam_result_items.json
  def index
    @exam_result_items = ExamResultItem.all
  end

  # GET /exam_result_items/1
  # GET /exam_result_items/1.json
  def show
  end

  # GET /exam_result_items/new
  def new
    @exam_result_item = ExamResultItem.new
  end

  # GET /exam_result_items/1/edit
  def edit
  end

  # POST /exam_result_items
  # POST /exam_result_items.json
  def create
    @exam_result_item = ExamResultItem.new(exam_result_item_params)

    respond_to do |format|
      if @exam_result_item.save
        format.html { redirect_to @exam_result_item, notice: 'Exam result item was successfully created.' }
        format.json { render :show, status: :created, location: @exam_result_item }
      else
        format.html { render :new }
        format.json { render json: @exam_result_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exam_result_items/1
  # PATCH/PUT /exam_result_items/1.json
  def update
    respond_to do |format|
      if @exam_result_item.update(exam_result_item_params)
        format.html { redirect_to @exam_result_item, notice: 'Exam result item was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam_result_item }
      else
        format.html { render :edit }
        format.json { render json: @exam_result_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_result_items/1
  # DELETE /exam_result_items/1.json
  def destroy
    @exam_result_item.destroy
    respond_to do |format|
      format.html { redirect_to exam_result_items_url, notice: 'Exam result item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def submit_answer
    @exam_result_item.update(exam_result_item_params)
    @correct = @exam_result_item.check_answer(exam_result_item_params[:answer])
    respond_to do |format|
      format.js { render 'exam_results/item_result' }
    end
  end

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
