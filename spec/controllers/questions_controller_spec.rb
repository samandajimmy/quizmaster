require 'rails_helper'

describe QuestionsController do
	
  describe "GET #index" do
	  let(:question) { FactoryGirl.create(:question) }

    it "assigns @questions" do
      get :index
      @questions = question
      expect(assigns(:questions)).to eq([@questions])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
	
  describe "GET #new" do
	  it "populates an array of questions" do
	    get :new
	    assigns(:question).should be_a_new(Question)
	  end
	  
	  it "renders the :new view" do
	    get :new
	    response.should render_template :new
	  end
  end

  describe "POST #create" do
	  let(:question) { FactoryGirl.attributes_for(:question) }
	  let(:invalid_question) { FactoryGirl.attributes_for(:invalid_question) }

	  it "should redirect to index with a notice on successful save" do
		allow_any_instance_of(Question).to receive(:valid?).and_return(true)
	    post :create, params: { question: question } 
	    assigns[:question].should_not be_new_record
	    flash[:success].should_not be_blank
	    response.should redirect_to(questions_path)
	  end

	  it "should re-render new template on failed save" do
		allow_any_instance_of(Question).to receive(:valid?).and_return(false)
	    post :create, params: { question: invalid_question }
	    assigns[:question].should be_new_record
	    flash[:success].should be_blank
	    response.should render_template(:new)
	  end

	  it "should pass params to question" do
	    post :create, params: { question: question }
	    assigns[:question] == question
	  end
	end
   
end