class PasswordResetsController < ApplicationController
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
    #code
  end
end
