class QuestionsController < ApplicationController

  def new
    @question = Question.new
    @user = current_user
  end

  def create
    @questions = Question.all
    @question = Question.new(question_params)
    @user = User.find(params[:user_id])
    if @question.save
      flash[:notice] = "Success!"
      respond_to do |format|
        format.html { redirect_to user_path(current_user) }
        format.js
      end
    else
      flash[:alert] = "Question not saved."
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def edit
    @question = Question.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @question = Question.find(params[:id])
    @user = User.find(params[:user_id])
    if @question.update(question_params)
      flash[:notice] = "Your question has been updated!"
      respond_to do |format|
        format.html { redirect_to user_question_path(@user, @question)}
        format.js
      end
    else
      flash[:alert] = "Update not successful."
      render 'edit'
    end
  end


private
  def question_params
    params.require(:question).permit(:subject, :question, :user_id)
  end
end
