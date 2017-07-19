class UsersController < ApplicationController

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

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
