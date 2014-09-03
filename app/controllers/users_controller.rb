class UsersController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  def index
    @users = User.all.order(:name)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Thank you for signing up!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @questions = @user.questions
  end

  def edit
    @user = current_user
  end


private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end



end
