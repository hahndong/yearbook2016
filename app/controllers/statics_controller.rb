class StaticsController < ApplicationController
acts_as_token_authentication_handler_for User, only: [:email_invit]
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:landing_page]
  
def email_invit
	redirect_to root_path
end
def landing_page
end

def pricing
end

def design
end
end
