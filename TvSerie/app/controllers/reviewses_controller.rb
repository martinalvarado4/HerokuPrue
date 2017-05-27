class ReviewsesController < ApplicationController
  before_action :set_reviewse, only: [:show, :edit, :update, :destroy]
  before_action :set_serial

  # GET /reviewses
  # GET /reviewses.json
  def index
    @reviewses = Reviewse.all
  end

  # GET /reviewses/1
  # GET /reviewses/1.json
  def show
  end

  # GET /reviewses/new
  def new
    if current_user != nil
      @reviewse = Reviewse.new
    else
      authenticate_user!
    end
  end

  # GET /reviewses/1/edit
  def edit
  end

  # POST /reviewses
  # POST /reviewses.json
  def create
    if current_user != nil
      @reviewse = Reviewse.new(reviewse_params)
      @reviewse.user_id = current_user.id
      @reviewse.serial_id = @serial.id
    end

    if @reviewse.save
      redirect_to serial_path(@serial)
    else
      render 'new'
    end
  end

  # PATCH/PUT /reviewses/1
  # PATCH/PUT /reviewses/1.json
  def update
    respond_to do |format|
      if @reviewse.update(reviewse_params)
        format.html { redirect_to @reviewse, notice: 'Reviewse was successfully updated.' }
        format.json { render :show, status: :ok, location: @reviewse }
      else
        format.html { render :edit }
        format.json { render json: @reviewse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviewses/1
  # DELETE /reviewses/1.json
  def destroy
    if current_user != nil
      if current_user == @reviewse.user or current_user.admin == true
        @reviewse.destroy
        redirect_to serial_path(@serial), notice: 'Review was successfully destroyed.' 
      else
        redirect_to serial_path(@serial), notice: 'Usted no es el creador, no puede destruirlo' 
      end
    else
      redirect_to serial_path(@serial), notice: 'Usted no esta loggeado, no puede destruirlo'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reviewse
      @reviewse = Reviewse.find(params[:id])
    end
    def set_serial
      @serial = Serial.find(params[:serial_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reviewse_params
      params.require(:reviewse).permit(:comentario)
    end
end
