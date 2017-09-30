class ShoppingCartController < ApplicationController

 before_action  :logged_in_user , :buyer_user , :correct_user_S

 def show
   @user = User.find(params[:user_id])
   @cart = ShoppingCart.find(params[:id])
 end

 def edit #clear SCart
   @user = User.find(params[:user_id])
   @cart = ShoppingCart.find(params[:id])
   @cart.clear
   flash[:success] = "carrello svuotato"
   redirect_to user_shopping_cart_path(@user,@cart)
 end



end
