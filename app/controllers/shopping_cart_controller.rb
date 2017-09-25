class ShoppingCartController < ApplicationController
# da chiamare quando si crea un user e da collegare con
# un migrate agli user
  def create
    @cart = ShoppingCart.create
  end
#---


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

  def show
    @cart = ShoppingCart.find(params[:shopping_cart_id])
    @user = User.find(params[:user_id])
  end

  private
  def shopping_cart_params
    params.require(:cart).permit(:article,:price,:quantity)
end
