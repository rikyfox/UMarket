class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper   # by including the module into the Application controller we arrange to make them available in our controllers as well

  # Confirms a logged-in user.
    def logged_in_user                  # logged_in_user method is now available in all controllers
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
