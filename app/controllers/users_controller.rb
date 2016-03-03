class UsersController < ApplicationController
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: :auth
  after_action :verify_authorized, except: [:auth, :users_export]
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
      short_email = getemail.to_s.slice(0..(getemail.to_s.index("@")-1))
      @user = User.where("email like ?",  "%#{short_email}%").first
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
  def users_export
    @users=User.order(:full_name)
    respond_to do |format|
      format.csv { send_data @users.to_csv}
    end
  end

  private
  def user_params
    params.require(:user).permit(:full_name, :name, :address, :mobile_number, :facebook)
  end

  def getemail
    params[:email]
  end
end
