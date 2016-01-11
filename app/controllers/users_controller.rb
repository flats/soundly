class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy, :follow, :unfollow]
  skip_before_action :authenticate, only: [:index, :show]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.includes(:sounds).find_by(username: params[:username])
    @leaders = @user.leaders.includes(:sounds) unless @user.leaders.empty?
    @followers = @user.followers unless @user.followers.empty?
    render status: 404 unless @user
  end

  # GET /users/user_name/edit
  def edit
  end

  # PATCH/PUT /users/user_name
  def update
    if @user.update(user_params)
      flash[:success] = true
      redirect_to user_path(@user.username),
                  notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/user_name
  def destroy
    session[:user_id] = nil
    @user.destroy
    redirect_to :root, notice: 'Your account was deleted.'
  end

  # PUT /users/user_name/follow
  def follow
    if !current_user.follows?(@user)
      @user.followers << current_user
      flash[:success] = true
      notice = "You are now following #{@user.username}."
    else
      notice = "You are already following #{@user.username}."
    end
    redirect_to user_path(@user.username), notice: notice
  end

  # PUT /users/user_name/unfollow
  def unfollow
    if current_user.follows?(@user)
      @user.followers.delete(current_user)
      flash[:success] = true
      notice = "You are no longer following #{@user.username}."
    else
      notice = "You already aren't following #{@user.username}."
    end
    redirect_to user_path(current_user.username), notice: notice
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find_by(username: params[:username])
  end

  # Never trust parameters from the scary internet,
  #   only allow the white list through.
  def user_params
    params.require(:user).permit(:username, :password,
                                 :real_name, :bio, :image_url)
  end
end
