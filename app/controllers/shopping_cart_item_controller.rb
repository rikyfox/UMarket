class ShoppingCartItemController < ApplicationController

  def edit
    @user = User.find(params[:user_id])
    @cart = ShoppingCart.find(params[:shopping_cart_id])
    #passo un riferimento = è solo wrapper   (article_id == params[:id])
    item = @cart.shopping_cart_items.find_by item_id: params[:id]
    @article = Article.find(item)
    @price = @article.prezzo
    if @cart.add(@article, @price , 1)
      flash[:success] = "articolo aggiunto al carrello!"
    else
      flash[:warning] = "error-add_article"
    end
    market = @article.market_id
    redirect_to user_market_article_path(Market.find(market).user_id,@article.market_id, @article)
  end

  def delete

  end
end
