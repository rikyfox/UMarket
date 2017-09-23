class StaticPagesController < ApplicationController

  def home
    if logged_in? && current_user.vendor?
      @micropost  = current_user.microposts.build                           # current_user exists only if the user is logged in, so the @micropost variable should only be defined in this case.
      @feed_items = current_user.feed.paginate(page: params[:page])  
  end

  def search
	   if params[:q]
		     @help=params[:q]
		       @articoli = Article.where("name LIKE ?", "%#{@help}%").paginate(page: params[:page])
		         @negozi = Market.where("name LIKE ?", "%#{@help}%").paginate(page: params[:page])
	          else
		            redirect_to root_path
	             end
             end
           end
end
