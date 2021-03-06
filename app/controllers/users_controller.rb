class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]   # we restrict the filter to act only on the :index, :edit, :update and :destroy
                                                                            # actions by passing the appropriate only: options hash.

  before_action :correct_user,   only: [:edit, :update, :addbudget]     # thanks to correct_user before action (that defines the @user variable), we can
                                                                        # omit the @user assignments in the edit, update and addbudget actions.
  before_action :buyer_user,     only: :addbudget


  def index
    unless current_user.admin? || current_user.buyer?
      @vendors = User.vendor.paginate(page: params[:page])
    end
    @users = User.paginate(page: params[:page])
  end



  def show
	begin
		@user = User.find(params[:id])      # we’ve used params to retrieve the user id
		if !current_user.admin?
			if current_user.vendor?
				@microposts = @user.microposts.paginate(page: params[:page])
			end
			@markets = @user.markets.paginate(page: params[:page])
		else
			@users = User.paginate(page: params[:page])
		end
	rescue ActiveRecord::RecordNotFound
		redirect_to root_path
	end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)           # see below the user_params method
    if @user.role == "buyer"
      sc = ShoppingCart.create
      sl = ShoppingList.create
      @user.shopping_cart_id = sc.id
      @user.shopping_list_id = sl.id
    else
      @user.shopping_cart = nil
      @user.shopping_list = nil
    end
    if @user.save
        log_in @user
        flash[:success] = "Welcome to UMarket!"
        redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user=User.find(params[:id])
    name=@user.name
    redirect_to(root_url) unless current_user?(@user) || current_user.admin?
    if(@user.buyer?)
      ShoppingCart.find(@user.shopping_cart_id).destroy
      ShoppingList.find(@user.shopping_list_id).destroy
    end
    User.find(params[:id]).destroy
    flash[:success] = "User "+name+" deleted"
    redirect_to users_url
  end

  def following
    if current_user.vendor?
        @title = "Following"
        @user  = User.find(params[:id])
        if @user.vendor?
            @users = @user.following.paginate(page: params[:page])
        end
        render 'show_follow'
     end
  end

  def followers
    if current_user.vendor?
        @title = "Followers"
        @user  = User.find(params[:id])
        if @user.vendor?
            @users = @user.followers.paginate(page: params[:page])
        end
        render 'show_follow'
    end
  end

  def followingmarkets
		@title = "Following Markets"
		@user  = User.find(params[:id])
	if current_user?(@user)
		@markets = @user.followingmarkets.paginate(page: params[:page])
		render 'followmarkets/show_follow'
		return
	end
	redirect_to followingmarkets_user_path(current_user)
  end

  def addbudget
        if @user.budget <150
            @user.budget+=50
            @user.update_attribute(:budget, @user.budget)
            flash[:success] = "Increased credit"
        else
            flash[:warning] = "Error! Budget mast be lass then 150 to recharge it"
        end
    redirect_to @user
  end

  def description
    @user = User.find(params[:id])
    if current_user?(@user) && current_user.vendor?
        if @user.update_attributes(description_param)
            flash[:success] = "Description updated"
        end
    end
    redirect_to @user
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :role)
    end

    def description_param
        params.require(:user).permit(:description)
    end

    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)  # equivalent to redirect_to(root_url) unless @user == current_user
    end

end
