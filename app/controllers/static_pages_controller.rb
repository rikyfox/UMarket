class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build                           # current_user exists only if the user is logged in, so the @micropost variable should only be defined in this case.
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end
