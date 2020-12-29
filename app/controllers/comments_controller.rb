class CommentsController < ApplicationController
  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(text: params[:comment][:text])
    if @comment.save
      ApplicationCable.server.boradcast 'comment_channel', content: @comment
    end
  end
end
