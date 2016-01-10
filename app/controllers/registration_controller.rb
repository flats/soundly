class RegistrationController < ApplicationController
  skip_before_action :authenticate

  def new
    @user = User.new
  end

  def create
    @user = User.new(registration_params)
    binding.pry
    respond_to do |format|
      if @user.save && @user.username
        session[:user_id] = @user.id
        flash[:success] = true
        format.html { redirect_to user_path(@user.username),
          notice: 'You are now registered.' }
      else
        flash.now[:notice] = 'You are missing fields. Please try again.'
        format.html { render :new }
      end
    end
  end

  def registration_params
    params.require(:user).permit(:username, :password,
                                 :real_name, :bio, :image_url)
  end
end
