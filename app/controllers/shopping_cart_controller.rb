class ShoppingCartController < ApplicationController

 before_action  :logged_in_user , :buyer_user

 def show
   @user = User.find(params[:user_id])
   @cart = ShoppingCart.find(params[:id])
 end

end
