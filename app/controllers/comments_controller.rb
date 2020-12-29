class CommentsController < ApplicationController
  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @message = Message.new(text: params[:message][:text])
  end
end
