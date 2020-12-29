class CommentsController < ApplicationController
  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create

    @comment = Comment.create(comment_params)
    if @comment.save

      redirect_to "/items/#{comment.item.id}"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user_id, item_id: params[:item_id])
  end
end
