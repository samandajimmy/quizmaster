require 'rails_helper'

describe UsersController do
	
  describe "GET #new" do
	  it "populates an array of users" do
	    get :new
	    assigns(:user).should be_a_new(User)
	  end
	  
	  it "renders the :new view" do
	    get :new
	    response.should render_template :new
	  end
  end

  describe "POST #create" do
	  let(:user) { FactoryGirl.attributes_for(:user) }
	  let(:invalid_user) { FactoryGirl.attributes_for(:invalid_user) }

	  it "should redirect to index with a notice on successful save" do
			allow_any_instance_of(User).to receive(:valid?).and_return(true)
	    post :create, params: { user: user } 
	    assigns[:user].should_not be_new_record
	    flash[:success].should_not be_blank
	    response.should redirect_to(root_path)
	  end

	  it "should re-render new template on failed save" do
			allow_any_instance_of(User).to receive(:valid?).and_return(false)
	    post :create, params: { user: invalid_user }
	    assigns[:user].should be_new_record
	    flash[:success].should be_blank
	    response.should render_template(:new)
	  end

	  it "should pass params to user" do
	    post :create, params: { user: user }
	    assigns[:user] == user
	  end
	end
   
end