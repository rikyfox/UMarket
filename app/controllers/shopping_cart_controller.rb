class ShoppingCartController < ApplicationController

 before_action  :logged_in_user , :buyer_user , :correct_user_S

 def show
   @user = User.find(params[:user_id])
   @cart = ShoppingCart.find(params[:id])
   @total = 0
   @cart.shopping_cart_items.each do |elem|
      quantity = elem.quantity
      current_val = Article.find(elem.item_id).prezzo
      @total += (current_val * quantity)
    end
 end

 def edit #clear SCart
   @user = User.find(params[:user_id])
   @cart = ShoppingCart.find(params[:id])
   @cart.clear
   flash[:success] = "carrello svuotato"
   redirect_to user_shopping_cart_path(@user,@cart)
 end



end
