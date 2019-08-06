CHARACTER_LIST = [
  'MINATO YUKINA',"IMAI LISA","HIKAWA SAYO","UDAGAWA AKO","SHIROKANE RINKO",
  'TOYAMA KASUMI ','HANAZONO TAE', 'USHIGOME RIMI ','YAMABUKI SAYA ','ICHIGAYA ARISA ',
  'MITAKE RAN ','AOBA MOCA ','UDAGAWA TOMOE ','UEHARA HIMARI ','HAZAWA TSUGUMI ',
  'MARUYAMA AYA ','HIKAWA HINA ','SHIRASAGI CHISATO ','YAMATO MAYA ','WAKAMIYA EVE ',
  'TSURUMAKI KOKORO ','SETA KAORU ','MATSUBARA KANON ','KITAZAWA HAGUMI ','OKUSAWA MISAKI ',
]
class WorkingCardsController < ApplicationController
  # before_action :set_working_card, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /working_cards
  # GET /working_cards.json
  def index
    list = WorkingCard.distinct.pluck(:name)
    @status = WorkingCard.where(sold:false).group(:name,).count
    list.each do |character|
      @status[character] = @status[character] ? (@status[character]) : 0
    end
    @working_cards = WorkingCard.all
    @characters = CHARACTER_LIST
  end

  # GET /working_cards/1
  # GET /working_cards/1.json
  def show
  end

  # GET /working_cards/new
  def new
    @characters = CHARACTER_LIST
  end

  # POST /working_cards
  # POST /working_cards.json
  def create
    # @working_card = WorkingCard.new(working_card_params)
    character = params['post']['character']
    code = character.split(' ')[1]
    quantity = params['post']['quantity'].to_i
    quantity.times do |i|
      card = WorkingCard.new(:name => character,:codeName => code, :sold => false)
      card.save
    end
    redirect_to backend_path
    return
  end

  # DELETE /working_cards/1
  # DELETE /working_cards/1.json
  def destroy
    @working_card.destroy
    respond_to do |format|
      format.html { redirect_to working_cards_url, notice: 'Working card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def drawOne
    character = WorkingCard.where(sold:false).sample
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
      @working_card = WorkingCard.find(params[:id])
    end
end
