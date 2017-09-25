class ShoppingCartController < ApplicationController

 before_action  :logged_in_user , :buyer_user

 def show
   @user = User.find(params[:user_id])
   @cart = ShoppingCart.find(params[:id])
 end

  private
  def shopping_cart_params
    params.require(:cart).permit(:article,:price,:quantity)
  end

end
