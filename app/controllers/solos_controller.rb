class SolosController < ApplicationController
  acts_as_token_authentication_handler_for User, only: [:index]
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index]
  after_action :verify_authorized, except: [:index, :designs, :volunteer, :thankyou]
  before_action :set_solo, only: [:show, :edit, :update, :destroy]

  def index
    @solos = Solo.all
    @solo = Solo.new
    
  end

  def show
    authorize @solo
  end

  def new
    @solo = Solo.new
    authorize @solo
  end

  # GET /solos/1/edit
  def edit
    authorize @solo
  end

  def create
    @solo = Solo.new(solo_params)
    @solo.user_id = current_user.id
    respond_to do |format|
      if @solo.save
        format.html { redirect_to @solo, notice: 'Solo was successfully created.' }
        format.json { render :show, status: :created, location: @solo }
      else
        format.html { render :new }
        format.json { render json: @solo.errors, status: :unprocessable_entity }
      end
    end
    authorize @solo
  end

  def update
    if @solo.update(solo_params)
      redirect_to @solo, notice: 'Solo was successfully updated.'
    else
      render :edit
    end
    authorize @solo
  end

  # DELETE /solos/1
  # DELETE /solos/1.json
  def destroy
    @solo.destroy
    respond_to do |format|
      format.html { redirect_to solos_url, notice: 'Solo was successfully destroyed.' }
      format.json { head :no_content }
    end
    authorize @solo
  end

  def designs
  end

  def volunteer
    current_user.update_attribute(:volunteer, 1)

    SendToUsers.volunteer(current_user).deliver_now
    redirect_to solos_thankyou_path
  end

  def thankyou
  end

  private
    def set_solo
      @solo = Solo.find(params[:id])
    end

    def solo_params
      params.require(:solo).permit(:picture, :quote, :ans1, :ans2, :ans3, :ans4, :ans5, :ans6, :and7, :ans8, :qn9, :ans9, :qn10, :ans10)
    end
end
