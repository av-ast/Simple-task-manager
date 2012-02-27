class CommentsController < ApplicationController
  before_filter :require_login
  before_filter :ya_acl

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    unless @comment.save
        flash[:error] = @comment.errors.full_messages.uniq.first
    end
    redirect_to :back
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end
end
