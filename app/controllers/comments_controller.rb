class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params.except(:username, :date))
    @comment.user_id = current_user.id

    @comment.save!
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :username, :date)
  end
end
