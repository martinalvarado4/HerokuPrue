class ReviewchesController < ApplicationController
  before_action :set_reviewch, only: [:show, :edit, :update, :destroy]
  before_action :set_serial
  before_action :set_chapter

  # GET /reviewches
  # GET /reviewches.json
  def index
    @reviewches = Reviewch.all
  end

  # GET /reviewches/1
  # GET /reviewches/1.json
  def show
  end

  # GET /reviewches/new
  def new
    if current_user != nil
      @reviewch = Reviewch.new
    else
      authenticate_user!
    end
  end

  # GET /reviewches/1/edit
  def edit
  end

  # POST /reviewches
  # POST /reviewches.json
  def create
    if current_user != nil
      @reviewch = Reviewch.new(reviewch_params)
      @reviewch.user_id = current_user.id
      @reviewch.chapter_id = @chapter.id
    end

    if @reviewch.save
      redirect_to serial_chapter_path(@serial,@chapter)
    else
      render 'new'
    end
  end

  # PATCH/PUT /reviewches/1
  # PATCH/PUT /reviewches/1.json
  def update
    respond_to do |format|
      if @reviewch.update(reviewch_params)
        format.html { redirect_to @reviewch, notice: 'Reviewch was successfully updated.' }
        format.json { render :show, status: :ok, location: @reviewch }
      else
        format.html { render :edit }
        format.json { render json: @reviewch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviewches/1
  # DELETE /reviewches/1.json
  def destroy
    if current_user != nil
      if current_user == @reviewch.user or current_user.admin == true
        @reviewch.destroy
        redirect_to serial_chapter_path(@serial,@chapter), notice: 'Review was successfully destroyed.' 
      else
        redirect_to serial_chapter_path(@serial,@chapter), notice: 'Usted no es el creador, no puede destruirlo' 
      end
    else
      redirect_to serial_chapter_path(@serial,@chapter), notice: 'Usted no esta loggeado, no puede destruirlo' 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reviewch
      @reviewch = Reviewch.find(params[:id])
    end

    def set_serial
      @serial = Serial.find(params[:serial_id])
    end

    def set_chapter
      @chapter = Chapter.find(params[:chapter_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reviewch_params
      params.require(:reviewch).permit(:comentario,:rating)
    end
end
