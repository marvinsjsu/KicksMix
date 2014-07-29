class Api::CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end


  def create
    @commentable = find_commentable

    @commentable.comments.build(comments_params)

    if @commentable.save
      @commentable
    else
      @commentable.errors
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(comments_params)
      render @comment
    else
      render @comment.errors
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comments_params
    params.require(:comment).permit(:comments_by, :content, :parent_id);
  end

  def find_commentable
    @model = ""
    @find_val = ""

    params.each do |name, value|
      if name === "model"
        @model = value
      end

      if name === "model_id"
        @find_val = value
      end
    end

    @model.classify.constantize.find(@find_val)
  end
end