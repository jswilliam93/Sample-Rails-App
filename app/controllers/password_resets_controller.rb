class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Password reset sent to mail"
      redirect_to root_url
    else
      flash.now[:danger] = "email address not found"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.password_reset_expired?
      flash[:danger] = "session for reset expired"
      redirect_to new_password_reset_url
    elsif(params[:user][:password].blank? &&
          params[:user][:password_confirmation].blank?)
        flash[:danger] = "Password can't be blank."
        render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user_params
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def get_user
      @user = User.find_by(email: params[:email])
      unless (@user && @user.authenticated?(:reset, params[:id])
        && @user.activated)
        redirect_to root_url
    end

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

end
