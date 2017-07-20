class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]   # we restrict the filter to act only on the :index, :edit, :update and :destroy
                                                                            # actions by passing the appropriate only: options hash.

  before_action :correct_user,   only: [:edit, :update]     # thanks to correct_user before filter (that defines the @user variable), we can
                                                            # omit the @user assignments in the edit and update actions.
  before_action :admin_user,     only: :destroy


  def index
    @users = User.paginate(page: params[:page])
  end



  def show
    @user = User.find(params[:id])      # we’ve used params to retrieve the user id
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)           # see below the user_params method
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
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)  # equivalent to redirect_to(root_url) unless @user == current_user
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
