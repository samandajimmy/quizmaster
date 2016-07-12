class QuestionsController < ApplicationController
  def index
    @questions = Question.paginate(page: params[:page])

  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(get_params)
    if @question.save
      flash[:success] = "Your question has been created!"
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(get_params)
      flash[:success] = "Your question has been updated!"
      redirect_to questions_path
    else
      render 'edit'
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = "question deleted"
    redirect_to questions_path
  end

  private

    def get_params
      params.require(:question).permit!
    end
end
