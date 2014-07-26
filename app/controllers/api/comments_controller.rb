class CommentsController < ApplicationController

  def create
    @shoe = Shoe.find(params[:shoe_id])
    @shoe.comments.new(comments_params)

    if @shoe.save
      render @shoe
    else
      render @shoe.errors
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
    params.require(:comment).permit(:user_id, :shoe_id, :content);
  end

end