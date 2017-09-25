class ShoppingCartController < ApplicationController

 before_action  :logged_in_user , :buyer_user

 def show
   @user = User.find(params[:user_id])
   @cart = ShoppingCart.find(params[:id])

 end


  def add_article
    #@cart = ShoppingCart.find(params[:id])
    @cart = ShoppingCart.create
    @quantita = params[:quantity]
    @article = Article.find(params[:article])
    @price = params[:price]
    if @cart.add(shopping_cart_params)
      flash[:success] = "articolo aggiunto nel carrello!"
    else
      flash[:warning] = "error-add_article"
    end
  end



  private
  def shopping_cart_params
    params.require(:cart).permit(:article,:price,:quantity)
  end

end
