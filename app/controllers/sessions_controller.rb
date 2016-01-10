class SessionsController < ApplicationController
  skip_before_action :authenticate

  def login
    if request.post?
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = true
        redirect_to user_path(user.username), notice: "Welcome back, #{user.real_name}!"
      else
        flash[:notice] = "Your username or password was incorrect. Please try again."
      end
    end
  end

  def logout
  end
end
