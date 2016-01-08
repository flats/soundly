class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.includes(:sounds).find_by(username: params[:username])
    binding.pry
    if !@user
      render :status => 404
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save && @user.username
        format.html { redirect_to @user,
          notice: 'User was successfully created.' }
      else
        flash.now[:notice] = "Missing fields."
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user,
                      notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html {
        redirect_to home_index,
                    notice: 'Your account was destroyed.'
      }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  #   only allow the white list through.
  def user_params
    params.require(:user).permit(:username, :password,
                                 :real_name, :bio, :image_url)
  end
end
