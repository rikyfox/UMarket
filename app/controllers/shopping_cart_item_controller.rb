class ShoppingCartItemController < ApplicationController

  def edit
    @user = User.find(params[:user_id])
    @cart = ShoppingCart.find(params[:shopping_cart_id])
    #passo un riferimento = è solo wrapper   (article.id == params[:id])
    @article = Article.find(params[:id])
    @price = @article.prezzo
    if @cart.add(@article, @price , 1)
      flash[:success] = "articolo aggiunto al carrello!"
    else
      flash[:warning] = "error-add_article"
    end
    market = @article.market_id
    redirect_to user_market_article_path(Market.find(market).user_id,@article.market_id, @article)
  end

  def destroy
    @user = User.find(params[:user_id])
    @cart = ShoppingCart.find(params[:shopping_cart_id])
    #passo un riferimento = è solo wrapper   (article_id == params[:id])
    @article = Article.find(params[:id])
    if @cart.remove(@article , 1 )
      flash[:success] = "elemento cancellato -1"
    else
      flash[:warning] = "error-destroy_article"
    end
    redirect_to user_shopping_cart_path(@user,@cart)
  end

end
