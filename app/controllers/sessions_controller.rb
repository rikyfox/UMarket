class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      if user.vendor?
		flash[:success] = "Vendor login successful"
	  elsif	user.buyer?
		flash[:success] = "Buyer login successful"
	  else
		flash[:success] = "Admin login successful"
	  end	
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "Logout successful"
    redirect_to root_url
  end
end
