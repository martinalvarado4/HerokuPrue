class SerialsController < ApplicationController
  before_action :set_serial, only: [:show, :edit, :update, :destroy]

  # GET /serials
  # GET /serials.json
  def index
    @serials = Serial.all
  end

  # GET /serials/1
  # GET /serials/1.json
  def show
    if @serial.chapters.blank?
      @serial.rating = 0
    else
      @serial.rating = @serial.chapters.average(:rating).round(2)
    end
    @serial.save
  end

  # GET /serials/new
  def new
    if current_user != nil 
      if current_user.parent == nil
        @serial = Serial.new
      else
        redirect_to serials_path, notice: 'Usted es un niño, no puede agregar series'
      end
    else
      authenticate_user!
    end
  end

  # GET /serials/1/edit
  def edit
    if current_user != nil
      if current_user != @serial.user and current_user.admin != true
        redirect_to serials_path, notice: 'Usted no es el creador, no puede editarlo'
      end
    else
      redirect_to serials_path, notice: 'Usted no esta loggeado, no puede editarlo' 
    end
  end

  # POST /serials
  # POST /serials.json
  def create
    @serial = Serial.new(serial_params)
    @serial.user_id = current_user.id
    @serial.rating = 0

    respond_to do |format|
      if @serial.save
        format.html { redirect_to @serial, notice: 'Serial was successfully created.' }
        format.json { render :show, status: :created, location: @serial }
      else
        format.html { render :new }
        format.json { render json: @serial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /serials/1
  # PATCH/PUT /serials/1.json
  def update
    respond_to do |format|
      if @serial.update(serial_params)
        format.html { redirect_to @serial, notice: 'Serial was successfully updated.' }
        format.json { render :show, status: :ok, location: @serial }
      else
        format.html { render :edit }
        format.json { render json: @serial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /serials/1
  # DELETE /serials/1.json
  def destroy
    if current_user != nil
      if current_user == @serial.user or current_user.admin == true
        @serial.destroy
        redirect_to serials_path, notice: 'Serial was successfully destroyed.' 
      else
        redirect_to serials_path, notice: 'Usted no es el creador, no puede destruirlo' 
      end
    else
      redirect_to serials_path, notice: 'Usted no es el creador, no puede destruirlo' 
    end
  end
  
  def search
    s1 = filtrar_genero(params)
    s2 = filtrar_año(params, s1)
    s3 = filtrar_rating(params,s2)
    @serials = filtrar_titulo(params, s3)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_serial
      @serial = Serial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def serial_params
      params.require(:serial).permit(:genero, :ano, :titulo, :descripcion, :rating)
    end
end

def filtrar_genero(params)
  if params[:genero_serial] != '-'
    s = Serial.where(genero: params[:genero_serial])
  else
    s = Serial.all
  end
  return s
end
def filtrar_año(params , lista)
  if params[:ano_serial] != '-'
    s = lista.select{|serie| serie.ano == params[:ano_serial].to_i}
  else
    s = lista
  end
  return s
end
def filtrar_rating(params, lista)
  if params[:rating_serial] != '-'
    s = lista.select{|serie| serie.rating >= params[:rating_serial].to_i}
  else
    s = lista
  end
  return s
end
def filtrar_titulo(params, lista)
  if params[:palabra_clave] != '-'
    s = lista.select{|serie| serie.titulo.include?(params[:palabra_clave])}
  else
    s = lista
  end
  return s
end
