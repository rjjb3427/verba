class PagesController < AuthenticatedController
  def writing
    @post_today = current_user.posts.today
  end

  def profile
    @post_today = current_user.posts.today
    @posts = current_user.posts
    @points = @posts.sum(:points)
    @current_streak = current_user.streak
  end

  def archive
    @posts = current_user.posts
  end
end
