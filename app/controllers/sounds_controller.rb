class SoundsController < ApplicationController
  before_action :set_sound, only: [:edit, :update, :destroy]
  skip_before_action :authenticate, only: [:index, :show]

  # GET /sounds
  def index
    @sounds = Sound.includes(:user).all
    # @sounds = Sound.all
  end

  # GET /sounds/1
  def show
    @sound = Sound.includes(:soundfile).find(params[:id])
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
    @sound = Sound.new(title: sound_params[:title], user: current_user)
    @soundfile = Soundfile.create(
      file_name: sound_params[:soundfiles][:soundfile].original_filename,
      content_type: sound_params[:soundfiles][:soundfile].content_type,
      sound: @sound)
    @soundfile.write_attached_file(tempfile: sound_params[:soundfiles][:soundfile].tempfile)
    @soundfile.save

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
    binding.pry
    unless sound_params[:soundfiles][:soundfile].nil?

      Sound.delete_attached_file(@sound)
      @sound.update(title: params[:sound][:title], soundfile: params[:sound][:soundfile][:filename])
      @sound.write_attached_file(tempfile: params[:sound][:soundfile][:tempfile])
    else
      @sound.title = params[:sound][:title]
      @sound.save
    end
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
      params.require(:sound).permit(:title, soundfiles: [ :soundfile ], soundfiles_attributes: [ :file_name ])
    end
end
