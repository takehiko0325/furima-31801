class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    redirect_to "/items/#{comment.item.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item.id])
  end
end
