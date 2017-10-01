class MarketsController < ApplicationController

  before_action :logged_in_user, only: [:new, :edit, :update, :create, :destroy]
  before_action :correct_user,   only: :destroy


  def new
	@user=User.find(params[:user_id])
	unless current_user?(@user)
		redirect_to current_user
	end
	@market=Market.new
  end
  
  def create
  	@user=User.find(params[:user_id])
    @market = @user.markets.build(market_params)  #Note the use of strong parameters via micropost_params, which permits only the micropost’s content attribute to be modified through the web.
   
   if @market.save && @user.save
        flash[:success] = "Market created!"
        redirect_to user_market_path(@user, @market)
    else
     @feed_items = []
        redirect_to new_user_market_path(@user)
    end
  end
  
  def show
	begin
		@user = User.find(params[:user_id])
		@market = @user.markets.find(params[:id])
		@articles = @market.articles.paginate(page: params[:page])
	rescue ActiveRecord::RecordNotFound
		redirect_to root_path
	end
	end
  
  def edit
	@user=User.find(params[:user_id])
	@market = @user.markets.find(params[:id])
	unless current_user?(@user)
		redirect_to current_user
	end
  end
  
  def update
	@user=User.find(params[:user_id])
	@market = @user.markets.find(params[:id])

    if @market.update_attributes(market_params)
      flash[:success] = "Market updated"
      redirect_to user_market_path(@user, @market)
    else
      redirect_to edit_user_market_path(@user, @market)
    end
  end
  
   def destroy
    User.find(params[:user_id]).markets.find(params[:id]).destroy
    #da completare con destroy degli articoli, e destroy degli articoli nei carrelli?
	flash[:success] = "Market deleted"
    redirect_to current_user
  end
  
  private 
  
  def market_params
        params.require(:market).permit(:name, :tipo, :nation, :city)  # list of attributes permitted to be modified through the web
    end

	def correct_user
      @market = current_user.markets.find_by(id: params[:id])
      redirect_to current_user if @market.nil?
    end
end
