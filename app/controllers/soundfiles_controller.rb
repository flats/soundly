class SoundfilesController < ApplicationController
  before_action :set_soundfile, only: [:show, :edit, :update, :destroy]

  # GET /soundfiles
  # GET /soundfiles.json
  def index
    @soundfiles = Soundfile.all
  end

  # GET /soundfiles/1
  # GET /soundfiles/1.json
  def show
  end

  # GET /soundfiles/new
  def new
    @soundfile = Soundfile.new
  end

  # GET /soundfiles/1/edit
  def edit
  end

  # POST /soundfiles
  # POST /soundfiles.json
  def create
    @soundfile = Soundfile.new(soundfile_params)

    respond_to do |format|
      if @soundfile.save
        format.html { redirect_to @soundfile, notice: 'Soundfile was successfully created.' }
        format.json { render :show, status: :created, location: @soundfile }
      else
        format.html { render :new }
        format.json { render json: @soundfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /soundfiles/1
  # PATCH/PUT /soundfiles/1.json
  def update
    respond_to do |format|
      if @soundfile.update(soundfile_params)
        format.html { redirect_to @soundfile, notice: 'Soundfile was successfully updated.' }
        format.json { render :show, status: :ok, location: @soundfile }
      else
        format.html { render :edit }
        format.json { render json: @soundfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soundfiles/1
  # DELETE /soundfiles/1.json
  def destroy
    @soundfile.destroy
    respond_to do |format|
      format.html { redirect_to soundfiles_url, notice: 'Soundfile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soundfile
      @soundfile = Soundfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def soundfile_params
      params.require(:soundfile).permit(:sound_id, :file_name, :content_type, :file_size)
    end
end
