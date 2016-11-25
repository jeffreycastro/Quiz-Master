class ExamItemsController < ApplicationController
  before_action :set_exam_item, only: [:show, :edit, :update, :destroy]

  # GET /exam_items
  # GET /exam_items.json
  def index
    @exam_items = ExamItem.all
  end

  # GET /exam_items/1
  # GET /exam_items/1.json
  def show
  end

  # GET /exam_itemss/new
  def new
    @exam_item = ExamItem.new
  end

  # GET /exam_items/1/edit
  def edit
  end

  # POST /exam_items
  # POST /exam_items.json
  def create
    @exam_item = ExamItem.new(exam_item_params)

    respond_to do |format|
      if @exam_item.save
        format.html { redirect_to @exam_item, notice: 'Exam item was successfully created.' }
        format.json { render :show, status: :created, location: @exam_item }
      else
        format.html { render :new }
        format.json { render json: @exam_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exam_items/1
  # PATCH/PUT /exam_items/1.json
  def update
    respond_to do |format|
      if @exam_item.update(exam_item_params)
        format.html { redirect_to @exam_item, notice: 'Exam item was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam_item }
      else
        format.html { render :edit }
        format.json { render json: @exam_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_items/1
  # DELETE /exam_items/1.json
  def destroy
    @exam_item.destroy
    respond_to do |format|
      format.html { redirect_to exam_items_url, notice: 'Exam item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_item
      @exam_item = ExamItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_item_params
      params.require(:exam_item).permit(:question, :exam_id)
    end
end
