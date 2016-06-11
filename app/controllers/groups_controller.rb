class GroupsController < ApplicationController
include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  after_action :verify_authorized, except: [:update, :destroy]
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
    @group = Group.new
    authorize Group
  end
  def indexprint
    @groups = Group.all
    authorize Group
  end
    
  def show
    authorize @group
  end

  def new
    @group = Group.new
    authorize @group
  end

  def edit
    @users = @group.users.collect(&:full_name).uniq
    authorize @group
  end

  def create
    @group = Group.new(group_params)
    
    set_users
    if @group.users.include?(current_user)
        if @group.save
          redirect_to edit_group_path(@group), notice: 'Group was successfully created.'
        else
          redirect_to new_group_path
        end
    else
      redirect_to new_group_path
    end
    
    authorize @group
  end

  def update
    @users = User.where(:id => params[:user])
    @group.users.destroy_all
    set_users
    if @group.users.include?(current_user)
      if @group.save
        redirect_to edit_group_path(@group), notice: 'Group was successfully updated.'
      else
        redirect_to edit_group_path(@group)
      end
    else

      redirect_to edit_group_path(@group)
    end
    
  end

  def destroy
    
    @group.destroy
    redirect_to groups_path, notice: 'Group was successfully destroyed.'
    
  end

  def typeahead
    render json: User.all.to_json( :only => [:full_name] )
    authorize User
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:picture)
    end

    def set_users
      if params[:user1]
        @user1 = User.where(full_name: params[:user1]) 
        @group.users << @user1
      end
      if params[:user2]
        @user2 = User.where(full_name: params[:user2]) 
        @group.users << @user2
      end
      if params[:user3]
        @user3 = User.where(full_name: params[:user3]) 
        @group.users << @user3
      end
      if params[:user4]
        @user4 = User.where(full_name: params[:user4]) 
        @group.users << @user4
      end
      if params[:user5]
        @user5 = User.where(full_name: params[:user5]) 
        @group.users << @user5
      end
      if params[:user6]
        @user6 = User.where(full_name: params[:user6]) 
        @group.users << @user6
      end
      if params[:user7]
        @user7 = User.where(full_name: params[:user7]) 
        @group.users << @user7
      end
      if params[:user8]
        @user8 = User.where(full_name: params[:user8]) 
        @group.users << @user8
      end
      if params[:user9]
        @user9 = User.where(full_name: params[:user9])
        @group.users << @user9
      end
      if params[:user10]
        @user10 = User.where(full_name: params[:user10]) 
        @group.users << @user10
      end
    end

end
