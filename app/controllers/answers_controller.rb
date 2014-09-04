class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params, params)#[:question_id], params[:user_id])
    @question = Question.find(params[:question_id])
    @user = User.find(@question.user_id)
    @answer.question_id = @question.id
    @answer.user_id = @user.id

    if @answer.save
      flash[:notice] = "Answer submitted, thanks for your help!"
      respond_to  do |format|
        format.html { redirect_to user_question_path(@user, @question) }
        format.js
      end
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
