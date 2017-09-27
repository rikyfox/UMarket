class ReviewsController < ApplicationController

  before_action :logged_in_user , only: [:create, :destroy]
  before_action :buyer_user
  #da VERIFICARE correct_user_R
  before_action :correct_user_R , only: :destroy


  def create
    if current_user.buyer?
      @review = current_user.reviews.build(review_params)
      if @review.save
        flash[:success] = "Review created!"
      else
        flash[:warning] = "Review-create Err"
      end
      article = Article.find(@review.article_id)
      redirect_to user_market_article_path(
      article.market.user,article.market,article)
    end
  end

  def destroy
    article = Article.find(@review.article_id)
    @review.destroy
    flash[:success] = "review deleted"
    redirect_to user_market_article_path(
    article.market.user,article.market,article)
  end

  private

    def review_params
        params.require(:review).permit(:content , :article_id , :user_id)  # list of attributes permitted to be modified through the web
    end
end
