class AnswersController < ApplicationController
  include AnswersHelper

  def answerIt
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def answerAction
    @question = Question.find(get_params[:question_id])
    @answer = Answer.new(get_params)
    if !correct_answer?(get_params[:value])
    	flash[:danger] = "Wrong answer!"
      return redirect_to answer_it_path
    end
    if @answer.save
      flash[:success] = "You are correct!"
      redirect_to questions_path
    else
     	render 'answerIt'
    end
  end

  def correct_answer?(answer)
  	correct_answer = in_words(@question.correct_answer).downcase == in_words(answer).downcase
  end

  private

    def get_params
      params.require(:answer).permit!
    end
end
