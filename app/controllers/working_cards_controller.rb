CHARACTER_LIST = [
  'MINATO YUKINA',"IMAI LISA","HIKAWA SAYO","UDAGAWA AKO","SHIROKANE RINKO",
  'TOYAMA KASUMI ','HANAZONO TAE', 'USHIGOME RIMI ','YAMABUKI SAYA ','ICHIGAYA ARISA ',
  'MITAKE RAN ','AOBA MOCA ','UDAGAWA TOMOE ','UEHARA HIMARI ','HAZAWA TSUGUMI ',
  'MARUYAMA AYA ','HIKAWA HINA ','SHIRASAGI CHISATO ','YAMATO MAYA ','WAKAMIYA EVE ',
  'TSURUMAKI KOKORO ','SETA KAORU ','MATSUBARA KANON ','KITAZAWA HAGUMI ','OKUSAWA MISAKI ',
]
class WorkingCardsController < ApplicationController
  # before_action :set_working_card, only: [:show, :edit, :update, :destroy]

  # GET /working_cards
  # GET /working_cards.json
  def index
    @working_cards = WorkingCard.all
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
    quantity = params['post']['quantity'].to_i
    quantity.times do |i|
      card = WorkingCard.new(:name => params["post"]['character'])
      card.save
    end

    respond_to do |format|
        format.html { render :new }
    end
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

  def deawOne
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_working_card
      @working_card = WorkingCard.find(params[:id])
    end
end
