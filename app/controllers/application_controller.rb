class ApplicationController < ActionController::Base

  before_action :mailer_set_url_options

  protect_from_forgery with: :exception
  include SessionsHelper   # by including the module into the Application controller we arrange to make them available in our controllers as well

  helper_method :mailbox, :conversation

  # Confirms a logged-in user.
    def logged_in_user                  # logged_in_user method is now available in all controllers
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    #Confirms a vendor user.
    def vendor_user
      redirect_to(root_url) unless current_user.vendor?
    end
    
    #Confirms a buyer user.
    def buyer_user
      redirect_to(root_url) unless current_user.buyer?
    end

    private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

end
