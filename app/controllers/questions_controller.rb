class QuestionsController < ApplicationController

  def new
    @question = Question.new
    @user = current_user
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Success!"
      respond_to do |format|
        format.html { redirect_to user_question_path(@question) }
        format.js
      end
    else
      flash[:alert] = "Question not saved."
      render 'new'
    end
  end

private
  def question_params
    params.require(:question).permit(:subject, :question, :user_id)
  end
end
