class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]
  before_action :set_serial

  # GET /chapters
  # GET /chapters.json
  def index
    @chapters = Chapter.all
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
    if @chapter.reviewches.blank?
      @chapter.rating = 0
    else
      @chapter.rating = @chapter.reviewches.average(:rating).round(2)
    end
    @chapter.save
  end

  # GET /chapters/new
  def new
    if current_user != nil
      if current_user == @serial.user or current_user.admin==true
        @chapter = Chapter.new
      else 
        redirect_to serial_path(@serial), notice: 'Usted no creo esta serial, no puede agregar capitulo'
      end
    else
      authenticate_user!
    end
  end

  # GET /chapters/1/edit
  def edit
    if current_user != nil
      if current_user != @chapter.user and current_user.admin != true
        redirect_to serial_path(@serial), notice: 'Usted no es el creador, no puede editarlo' 
      end
    else
      authenticate_user!
    end
  end

  # POST /chapters
  # POST /chapters.json
  def create
    if current_user != nil
      @chapter = Chapter.new(chapter_params)
      @chapter.user_id = current_user.id
      @chapter.serial_id = @serial.id
      @chapter.rating = 0
    end
    if @chapter.save
      Visto.create!(chapter_id:@chapter.id)
      redirect_to serial_path(@serial)
    else
      render 'new'
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to @chapter, notice: 'Chapter was successfully updated.' }
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    if current_user != nil
      if current_user == @chapter.user or current_user.admin == true
        @chapter.destroy
        redirect_to serial_path(@serial), notice: 'Chapter was successfully destroyed.' 
      else
        redirect_to serial_path(@serial), notice: 'Usted no es el creador, no puede destruirlo' 
      end
    else
      redirect_to serial_path(@serial), notice: 'Usted no esta loggeado, no puede destruirlo'
    end
  end

  def sacar
    @chapter.visto.users.delete(current_user)
    redirect_to serial_chapter_path(@serial,@chapter)
  end

  def meter
    @chapter.visto.users.push(current_user)
    redirect_to serial_chapter_path(@serial,@chapter)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end
    def set_serial
      @serial = Serial.find(params[:serial_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:largo, :numero, :descripcion)
    end
end
