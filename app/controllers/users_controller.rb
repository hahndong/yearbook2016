class UsersController < ApplicationController
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: :auth
  after_action :verify_authorized, except: :auth
  def index
    @users = User.all.order(full_name: :asc)
    authorize User
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
    authorize @user
  end
  def auth
    if getemail
      @user = User.find_by_email(getemail)
      @user.send_invit
      users_auth_path
    
    
    end
  end
  def send_invit
    @user = User.find(params[:user_id])
    @user.send_invit
  respond_to do |format|
    format.js
  end
  authorize @user
  end

  private
  def user_params
    params.require(:user).permit(:full_name, :name, :address, :mobile_number, :facebook)
  end

  def getemail
    params[:email]
  end
end
