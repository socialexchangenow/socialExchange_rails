class IndividualOffersController < ApplicationController
  before_action :set_individual_offer, only: [:show, :edit, :update, :destroy]

  # GET /individual_offers
  # GET /individual_offers.json
  def index
    @individual_offers = IndividualOffer.all
  end

  # GET /individual_offers/1
  # GET /individual_offers/1.json
  def show
  end

  # GET /individual_offers/new
  def new
    @individual_offer = IndividualOffer.new
  end

  # GET /individual_offers/1/edit
  def edit
  end

  # POST /individual_offers
  # POST /individual_offers.json
  def create 
    @individual_offer = IndividualOffer.new(individual_offer_params)

    respond_to do |format|
      if @individual_offer.save
        format.html { redirect_to @individual_offer, notice: 'Individual offer was successfully created.' }
        format.json { render :show, status: :created, location: @individual_offer }
      else
        format.html { render :new }
        format.json { render json: @individual_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /individual_offers/1
  # PATCH/PUT /individual_offers/1.json
  def update
    respond_to do |format|
      if @individual_offer.update(individual_offer_params)
        format.html { redirect_to @individual_offer, notice: 'Individual offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @individual_offer }
      else
        format.html { render :edit }
        format.json { render json: @individual_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /individual_offers/1
  # DELETE /individual_offers/1.json
  def destroy
    @individual_offer.destroy
    respond_to do |format|
      format.html { redirect_to individual_offers_url, notice: 'Individual offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_individual_offer
      @individual_offer = IndividualOffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def individual_offer_params
      params.require(:individual_offer).permit(:individual_id, :charity_offer_id)
    end
end
