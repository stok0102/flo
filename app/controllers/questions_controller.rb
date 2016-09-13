class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new
  end

  def create
    @user = User.find(params[:user_id])
    @question = @user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Question has been added"
      redirect_to user_path(@question.user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @question = Question.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question has been updated"
      redirect_to user_path(@question.user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question has been removed"
    redirect_to user_path(@user)
  end

private
  def question_params
    params.require(:question).permit(:title, :content, :user_id)
  end
end
