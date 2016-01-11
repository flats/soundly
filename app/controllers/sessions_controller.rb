class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new
  end

  def create
    respond_to do |format|
      if user = User.authenticate!(username: params[:username], password: params[:password])
        session[:user_id] = user.id
        format.html { redirect_to user_path(user.username), notice: "Welcome back, #{user.real_name}!" }
      else
        flash[:error] = "Your username or password was incorrect. Please try again."
        format.html { redirect_to :login }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end
