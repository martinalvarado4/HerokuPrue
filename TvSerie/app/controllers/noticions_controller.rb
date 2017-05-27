class NoticionsController < ApplicationController
  before_action :set_noticion, only: [:show, :edit, :update, :destroy]

  # GET /noticions
  # GET /noticions.json
  def index
    @noticions = Noticion.all
  end

  # GET /noticions/1
  # GET /noticions/1.json
  def show
  end

  # GET /noticions/new
  def new
    if current_user != nil
      @noticion = Noticion.new
    else
      authenticate_user!
    end
  end

  # GET /noticions/1/edit
  def edit
    if current_user != nil
      if current_user != @noticion.user and current_user.admin != true
        redirect_to noticion_path(@noticion), notice: 'Usted no es el creador, no puede editarlo' 
      end
    else
      authenticate_user!
    end
  end


  # POST /noticions
  # POST /noticions.json
  def create
    @noticion = Noticion.new(noticion_params)
    @noticion.user_id = current_user.id

    respond_to do |format|
      if @noticion.save
        format.html { redirect_to @noticion, notice: 'Noticion was successfully created.' }
        format.json { render :show, status: :created, location: @noticion }
      else
        format.html { render :new }
        format.json { render json: @noticion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /noticions/1
  # PATCH/PUT /noticions/1.json
  def update
    respond_to do |format|
      if @noticion.update(noticion_params)
        format.html { redirect_to @noticion, notice: 'Noticion was successfully updated.' }
        format.json { render :show, status: :ok, location: @noticion }
      else
        format.html { render :edit }
        format.json { render json: @noticion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noticions/1
  # DELETE /noticions/1.json
  def destroy
    if current_user != nil
      if current_user == @noticion.user or current_user.admin == true
        @noticion.destroy
        redirect_to noticions_path, notice: 'Noticia was successfully destroyed.' 
      else
        redirect_to noticions_path, notice: 'Usted no es el creador, no puede destruirlo' 
      end
    else
      redirect_to noticions_path, notice: 'Usted no esta loggeado, no puede destruirlo'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noticion
      @noticion = Noticion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def noticion_params
      params.require(:noticion).permit(:titulo, :contenido, :tipo, :serial_id)
    end
end
