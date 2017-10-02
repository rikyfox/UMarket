class ShoppingCartItemController < ApplicationController

  before_action  :logged_in_user , :buyer_user , :correct_user_S

  def edit #add
    @user = User.find(params[:user_id])
    @cart = ShoppingCart.find(params[:shopping_cart_id])
    #passo un riferimento = è solo wrapper   (article.id == params[:id])
    @article = Article.find(params[:id])
    @price = @article.prezzo
    if @cart.add(@article, @price , 1)
      link_item = @cart.shopping_cart_items.find_by item_id: @article.id
      link_item.update_attribute(:nome   ,@article.name  )
      link_item.update_attribute(:prezzo ,@article.prezzo)
      link_item.update_attribute(:aviable, true          )
      flash[:success] = "articolo aggiunto al carrello!"
    else
      flash[:warning] = "error-add_article"
    end
    market = @article.market_id
    redirect_to user_market_article_path(Market.find(market).user_id,@article.market_id, @article)
  end

  def destroy  #remove
    @user = User.find(params[:user_id])
    @cart = ShoppingCart.find(params[:shopping_cart_id])
    in_cycle = false
    @cart.shopping_cart_items.each do |elem|
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
end
