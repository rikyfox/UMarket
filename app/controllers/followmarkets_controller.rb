class FollowmarketsController < ApplicationController
  before_action :logged_in_user

  def create
    @market = Market.find(params[:market_followed_id])
    current_user.followmarket(@market)
    redirect_to user_market_path(@market.user,@market)
  end

  def destroy
    @market = Followmarket.find(params[:id]).market_followed
    current_user.unfollowmarket(@market)
    redirect_to user_market_path(@market.user,@market)
  end
end
