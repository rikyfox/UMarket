class ArticlesController < ApplicationController

  before_action :logged_in_user, only: [:new, :edit, :update, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
	@user=User.find(params[:user_id])
	@market=@user.markets.find(params[:market_id])
	unless current_user?(@user)
		redirect_to current_user
	end
	@article=Article.new
  end

  def create
  	@user=User.find(params[:user_id])
	@market = @user.markets.find(params[:market_id])
	@article = @market.articles.build(article_params)

   if @article.save && @market.save
        flash[:success] = "Article created!"
        redirect_to user_market_path(@user, @market) 	#user_market_article_path(@user, @market, @article)
    else
		@article.destroy
		@feed_items = []
        redirect_to new_user_market_article_path(@user, @market)
    end
  end

  def edit
	@user=User.find(params[:user_id])
	@market = @user.markets.find(params[:market_id])
	@article =@market.articles.find(params[:id])
	unless current_user?(@user)
		redirect_to current_user
	end
  end

  def update
	@user=User.find(params[:user_id])
	@market = @user.markets.find(params[:market_id])
	@article =@market.articles.find(params[:id])

    if @article.update_attributes(article_params)
      flash[:success] = "Article updated"
      redirect_to user_market_path(@user, @market)
    else
      redirect_to edit_user_market_article_path(@user, @market, @article)
    end

  end

  def destroy
	@user=User.find(params[:user_id])
	@market=@user.markets.find(params[:market_id])
	@market.articles.find(params[:id]).destroy
	flash[:success] = "Article deleted"
   redirect_to user_market_path(@user, @market)
  end

   def show
	   begin
			@user = User.find(params[:user_id])
			@market = @user.markets.find(params[:market_id])
			@article = @market.articles.find(params[:id])
			if  logged_in? && @current_user.buyer? 
				@review = current_user.reviews.build
			end
			#pre-alloco risorsa x 'shared/review_form'
		rescue ActiveRecord::RecordNotFound
			redirect_to root_path
		end
  end

  private

  def article_params
        params.require(:article).permit(:name, :prezzo, :description, :status, :picture)  # list of attributes permitted to be modified through the web
    end
	def correct_user
      @market = current_user.markets.find(params[:market_id])
	@article = @market.articles.find(params[:id])
      redirect_to current_user if @article.nil?
    end
	end
