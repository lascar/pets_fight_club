class ApplicationController < ActionController::Base
  # Authentication
  acts_as_token_authentication_handler_for User, fallback_to_devise: false
  before_action :authenticate_user!

end
