class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper   # by including the module into the Application controller we arrange to make them available in our controllers as well
end
