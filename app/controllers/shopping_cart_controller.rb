class ShoppingCartController < ApplicationController

  def add_article
    #come passo i parametri?? control -> view -> controll???
    @cart = ShoppingCart.find(params[:id])
    if @cart.add(@articolo , 88, @quantita)
      flash[:success] = "articolo aggiunto nel carrello!"
    else
      flash[:warning] = "error-add_article"
    end
    render 'show'
  end

  def show
    @cart = ShoppingCart.find(2)
    #definisco parametri da passare
    #anche le variabili @ le legge vier+controller
    params[:cart_id] = 2
    params[:id] = 2
    @article = Article.find(1)
    @quantita = 44
    if Article.any?
      Article.all.each do |elem|
        @cart.add(elem ,elem.prezzo)
      end
      @items = @cart.shopping_cart_items
    else
      @items = []
    end
  end

end
