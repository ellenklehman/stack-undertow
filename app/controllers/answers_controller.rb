class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    answer = Answer.new(answer_params, params[:question_id], current_user.id)
    question = Question.find(params[:question_id])
    user = User.find(question.user_id)

    if answer.save
      flash[:notice] = "Answer submitted, thanks for your help!"
      redirect_to user_question(user, question)
    else
      flash[:alert] = "Invalid answer, forget something?"
      render('new')
    end
  end

private

  def answer_params
    params.require(:answer).permit(:answer)
  end

end
