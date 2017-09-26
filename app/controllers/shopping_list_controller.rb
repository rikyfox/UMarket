class ShoppingListController < ApplicationController

  before_action  :logged_in_user , :buyer_user

  def show
    @user = User.find(params[:user_id])
    @list = ShoppingList.find(params[:id])
  end

  def edit #buy SCart -> create new order
      @user = User.find(params[:user_id])
      @cart = ShoppingCart.find(params[:id])# id == SCart_id// Wrapper
      @list = ShoppingList.find(@user.shopping_list_id)
      #passo tutti gli elementi su altra lista x poi cancellarli da cart
      val = @user.budget -= (@cart.total.fractional * 0.01)
      if val<0
        flash[:warning] = "non hai abbastanza credito per acquisire l'ordine"
      else
        @user.update_attribute(:budget, @user.budget)
        if @cart.shopping_cart_items.any?
          @cart.shopping_cart_items.each do |elem|
            art = Article.find(elem.item_id)
            qty = elem.quantity
            @list.add(art , qty)#agg a lista di comprati
            @cart.remove(art , qty)
          end
          flash[:success] = "il tuo ordine è stato completato!!"
        else
          flash[:success] = "il tuo carrello è vuoto!"
        end
      end
      redirect_to user_shopping_cart_path(@user,@cart)
    end

  end
