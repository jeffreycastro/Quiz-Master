require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ExamItemsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # ExamItem. As you add validations to ExamItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { question: "Question content" }
  }

  let(:invalid_attributes) {
    { question: "" }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ExamItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) do
    @exam = Exam.create!(name: "Exam name")
    valid_attributes.merge!(exam_id: @exam.id)
  end

  describe "GET #index" do
    it "assigns all exam_items as @exam_items" do
      exam_item = ExamItem.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:exam_items)).to eq([exam_item])
    end
  end

  describe "GET #show" do
    it "assigns the requested exam_item as @exam_item" do
      exam_item = ExamItem.create! valid_attributes
      get :show, params: {id: exam_item.to_param}, session: valid_session
      expect(assigns(:exam_item)).to eq(exam_item)
    end
  end

  describe "GET #new" do
    it "assigns a new exam_item as @exam_item" do
      get :new, params: {}, session: valid_session
      expect(assigns(:exam_item)).to be_a_new(ExamItem)
    end
  end

  describe "GET #edit" do
    it "assigns the requested exam_item as @exam_item" do
      exam_item = ExamItem.create! valid_attributes
      get :edit, params: {id: exam_item.to_param}, session: valid_session
      expect(assigns(:exam_item)).to eq(exam_item)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ExamItem" do
        expect {
          post :create, params: {exam_item: valid_attributes}, session: valid_session
        }.to change(ExamItem, :count).by(1)
      end

      it "assigns a newly created exam_item as @exam_item" do
        post :create, params: {exam_item: valid_attributes}, session: valid_session
        expect(assigns(:exam_item)).to be_a(ExamItem)
        expect(assigns(:exam_item)).to be_persisted
      end

      it "redirects to the created exam_item" do
        post :create, params: {exam_item: valid_attributes}, session: valid_session
        expect(response).to redirect_to(ExamItem.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved exam_item as @exam_item" do
        post :create, params: {exam_item: invalid_attributes}, session: valid_session
        expect(assigns(:exam_item)).to be_a_new(ExamItem)
      end

      it "re-renders the 'new' template" do
        post :create, params: {exam_item: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { question: "Updated question content" }
      }

      it "updates the requested exam_item" do
        exam_item = ExamItem.create! valid_attributes
        put :update, params: {id: exam_item.to_param, exam_item: new_attributes}, session: valid_session
        exam_item.reload
        expect(exam_item.question).to eq(new_attributes[:question])
      end

      it "assigns the requested exam_item as @exam_item" do
        exam_item = ExamItem.create! valid_attributes
        put :update, params: {id: exam_item.to_param, exam_item: valid_attributes}, session: valid_session
        expect(assigns(:exam_item)).to eq(exam_item)
      end

      it "redirects to the exam_item" do
        exam_item = ExamItem.create! valid_attributes
        put :update, params: {id: exam_item.to_param, exam_item: valid_attributes}, session: valid_session
        expect(response).to redirect_to(exam_item)
      end
    end

    context "with invalid params" do
      it "assigns the exam_item as @exam_item" do
        exam_item = ExamItem.create! valid_attributes
        put :update, params: {id: exam_item.to_param, exam_item: invalid_attributes}, session: valid_session
        expect(assigns(:exam_item)).to eq(exam_item)
      end

      it "re-renders the 'edit' template" do
        exam_item = ExamItem.create! valid_attributes
        put :update, params: {id: exam_item.to_param, exam_item: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested exam_item" do
      exam_item = ExamItem.create! valid_attributes
      expect {
        delete :destroy, params: {id: exam_item.to_param}, session: valid_session
      }.to change(ExamItem, :count).by(-1)
    end

    it "redirects to the exam_items list" do
      exam_item = ExamItem.create! valid_attributes
      delete :destroy, params: {id: exam_item.to_param}, session: valid_session
      expect(response).to redirect_to(exam_items_url)
    end
  end

end