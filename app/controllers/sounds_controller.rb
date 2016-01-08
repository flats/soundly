class SoundsController < ApplicationController
  before_action :set_sound, only: [:edit, :update, :destroy]

  # GET /sounds
  def index
    @sounds = Sound.includes(:user).all
    # @sounds = Sound.all
  end

  # GET /sounds/1
  def show
    @sound = Sound.include(:soundfile).find(params[:id])
  end

  # GET /sounds/new
  def new
    @sound = Sound.new
  end

  # GET /sounds/1/edit
  def edit
  end

  # POST /sounds
  def create
    @sound = Sound.new(sound_params)

    respond_to do |format|
      if @sound.save
        format.html { redirect_to @sound, notice: 'Sound was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /sounds/1
  def update
    respond_to do |format|
      if @sound.update(sound_params)
        format.html { redirect_to @sound, notice: 'Sound was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /sounds/1
  def destroy
    @sound.destroy
    respond_to do |format|
      format.html { redirect_to sounds_url, notice: 'Sound was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sound
      @sound = Sound.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sound_params
      params.require(:sound).permit(:title, :user_id)
    end
end
