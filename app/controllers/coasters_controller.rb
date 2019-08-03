class CoastersController < ApplicationController
  before_action :set_coaster, only: [:show, :edit, :update, :destroy]

  # GET /coasters
  # GET /coasters.json
  def index
    @coasters = Coaster.all
  end

  # GET /coasters/1
  # GET /coasters/1.json
  def show
  end

  # GET /coasters/new
  def new
    @coaster = Coaster.new
  end

  # POST /coasters
  # POST /coasters.json
  def create
    @coaster = Coaster.new(coaster_params)

    respond_to do |format|
      if @coaster.save
        format.html { redirect_to @coaster, notice: 'Coaster was successfully created.' }
        format.json { render :show, status: :created, location: @coaster }
      else
        format.html { render :new }
        format.json { render json: @coaster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coasters/1
  # DELETE /coasters/1.json
  def destroy
    @coaster.destroy
    respond_to do |format|
      format.html { redirect_to coasters_url, notice: 'Coaster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def deawOne
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coaster
      @coaster = Coaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coaster_params
      params.require(:coaster).permit(:name)
    end
end
