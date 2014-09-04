class QuestionsController < ApplicationController

  def new
    @question = Question.new
    @user = current_user
  end

  def index
    @questions = Question.all.order(:created_at)
  end

  def create
    @question = Question.new(question_params)
    @user = User.find(params[:user_id])
    @questions = @user.questions

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
    @user = User.find(@question.user_id)
    @answer = Answer.new
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

  def destroy
    Question.find(params[:id]).destroy
    redirect_to user_path(current_user)
  end


private
  def question_params
    params.require(:question).permit(:subject, :question, :user_id)
  end
end
