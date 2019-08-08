CHARACTER_LIST = [
  'TOYAMA KASUMI','HANAZONO TAE','USHIGOME RIMI','YAMABUKI SAYA','ICHIGAYA ARISA',
  'MITAKE RAN','AOBA MOCA','UDAGAWA TOMOE','UEHARA HIMARI','HAZAWA TSUGUMI',
  'MARUYAMA AYA','HIKAWA HINA','SHIRASAGI CHISATO','YAMATO MAYA','WAKAMIYA EVE',
  'MINATO YUKINA',"IMAI LISA","HIKAWA SAYO","UDAGAWA AKO","SHIROKANE RINKO",
  'TSURUMAKI KOKORO','SETA KAORU','MATSUBARA KANON','KITAZAWA HAGUMI','OKUSAWA MISAKI',
]
class CoastersController < ApplicationController
  # before_action :set_working_card, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /coasters
  # GET /coasters.json
  def index
    list = Coaster.distinct.pluck(:name)
    @status = Coaster.where(sold:false).group(:name,).count
    list.each do |character|
      @status[character] = @status[character] ? (@status[character]) : 0
    end
    @coasters = Coaster.all
    @characters = CHARACTER_LIST
  end

  # GET /coasters/1
  # GET /coasters/1.json
  def show
  end

  # GET /coasters/new
  def new
    @characters = CHARACTER_LIST
  end

  # POST /coasters
  # POST /coasters.json
  def create
    # @working_card = Coaster.new(working_card_params)
    character = params['post']['character']
    code = character.split(' ')[1]
    quantity = params['post']['quantity'].to_i
    quantity.times do |i|
      card = Coaster.new(:name => character,:codeName => code, :sold => false)
      card.save
    end
    redirect_to backend_path
    return
  end

  # DELETE /coasters/1
  # DELETE /coasters/1.json
  def destroy
    @working_card.destroy
    respond_to do |format|
      format.html { redirect_to coasters_url, notice: 'Working card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def drawOne
    character = Coaster.where(sold:false).sample
    if character == nil then
      render json: { }
    else
      code = character.codeName
      characterName = character.name
      character.sold = true
      character.soldTime = Time.zone.now.in_time_zone('Pacific Time (US & Canada)')
      character.save
      render json: { character: characterName ,code:code }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_working_card
      @working_card = Coaster.find(params[:id])
    end
end
