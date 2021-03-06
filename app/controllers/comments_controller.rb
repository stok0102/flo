class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    helpers.current_question
    @comment = Comment.find(params[:question_id])
  end

  def new
    @question = Question.find(params[:id])
    @comment = Comment.new
  end

  def create
    helpers.current_user
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new(comment_params)
    @comment.user_id = @current_user.id
    if @comment.save
      flash[:notice] = "Comment has been added"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    @comment = Comment.find(params[:question_id])
  end

  def update
    @question = Question.find(params[:question_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Comment has been updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:question_id])
    @comment.destroy
    flash[:notice] = "Comment has been removed"
    redirect_to root_path
  end

private
  def comment_params
    params.require(:comment).permit(:content, :commentable_id)
  end
end
