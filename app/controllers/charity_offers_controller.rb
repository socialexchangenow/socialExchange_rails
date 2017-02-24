class CharityOffersController < ApplicationController
  before_action :set_charity_offer, only: [:show, :edit, :update, :destroy]

  # GET /charity_offers
  # GET /charity_offers.json
  def index
    @charity_offers = CharityOffer.all
  end

  # GET /charity_offers/1
  # GET /charity_offers/1.json
  def show
  end

  # GET /charity_offers/new
  def new
    @charity_offer = CharityOffer.new
  end

  # GET /charity_offers/1/edit
  def edit
  end

  # POST /charity_offers
  # POST /charity_offers.json
  def create
    @charity_offer = CharityOffer.new(charity_offer_params)

    respond_to do |format|
      if @charity_offer.save
        format.html { redirect_to @charity_offer, notice: 'Charity offer was successfully created.' }
        format.json { render :show, status: :created, location: @charity_offer }
      else
        format.html { render :new }
        format.json { render json: @charity_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charity_offers/1
  # PATCH/PUT /charity_offers/1.json
  def update
    respond_to do |format|
      if @charity_offer.update(charity_offer_params)
        format.html { redirect_to @charity_offer, notice: 'Charity offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @charity_offer }
      else
        format.html { render :edit }
        format.json { render json: @charity_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charity_offers/1
  # DELETE /charity_offers/1.json
  def destroy
    @charity_offer.destroy
    respond_to do |format|
      format.html { redirect_to charity_offers_url, notice: 'Charity offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charity_offer
      @charity_offer = CharityOffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charity_offer_params
      params.require(:charity_offer).permit(:charity_id, :shortCode, :shortDescription, :longDescription, :amount)
    end
end
