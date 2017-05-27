class VistosController < ApplicationController
  before_action :set_visto, only: [:show, :edit, :update, :destroy]
  before_action :set_chapter
  before_action :set_serial

  # GET /vistos
  # GET /vistos.json
  def index
    @vistos = Visto.all
  end

  # GET /vistos/1
  # GET /vistos/1.json
  def show
  end

  # GET /vistos/new
  def new
    @visto = Visto.new
  end

  # GET /vistos/1/edit
  def edit
  end

  # POST /vistos
  # POST /vistos.json
  def create
    @visto = Visto.new(visto_params)


    respond_to do |format|
      if @visto.save
        format.html { redirect_to @visto, notice: 'Visto was successfully created.' }
        format.json { render :show, status: :created, location: @visto }
      else
        format.html { render :new }
        format.json { render json: @visto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vistos/1
  # PATCH/PUT /vistos/1.json
  def update
    #if @visto.users.include?(current_user)
    #  @visto.users.push(current_user)
    #else
    #  @visto.users.delete(current_user)
    #end
    #if @visto.update({users:@visto.users})
    #  redirect_to serial_chapter_path(@serial,@chapter)
    #else
    #  render 'edit'
    #end
  end

  # DELETE /vistos/1
  # DELETE /vistos/1.json
  def destroy
    @visto.destroy
    respond_to do |format|
      format.html { redirect_to vistos_url, notice: 'Visto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visto
      @visto = Visto.find(params[:id])
    end
    def set_chapter
      @chapter = Chapter.find(params[:chapter_id])
    end
    def set_serial
      @serial = Serial.find(params[:serial_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def visto_params
      params.fetch(:visto, {})
    end
end
