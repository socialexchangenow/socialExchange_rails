class BusinessCounterOffersController < ApplicationController
  before_action :set_business_counter_offer, only: [:show, :edit, :update, :destroy]

  # GET /business_counter_offers
  # GET /business_counter_offers.json
  def index
    @business_counter_offers = BusinessCounterOffer.all
  end

  # GET /business_counter_offers/1
  # GET /business_counter_offers/1.json
  def show
  end

  # GET /business_counter_offers/new
  def new
    @business_counter_offer = BusinessCounterOffer.new
  end

  # GET /business_counter_offers/1/edit
  def edit
  end

  # POST /business_counter_offers
  # POST /business_counter_offers.json
  def create
    @business_counter_offer = BusinessCounterOffer.new(business_counter_offer_params)

    respond_to do |format|
      if @business_counter_offer.save
        format.html { redirect_to @business_counter_offer, notice: 'Business counter offer was successfully created.' }
        format.json { render :show, status: :created, location: @business_counter_offer }
      else
        format.html { render :new }
        format.json { render json: @business_counter_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business_counter_offers/1
  # PATCH/PUT /business_counter_offers/1.json
  def update
    respond_to do |format|
      if @business_counter_offer.update(business_counter_offer_params)
        format.html { redirect_to @business_counter_offer, notice: 'Business counter offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_counter_offer }
      else
        format.html { render :edit }
        format.json { render json: @business_counter_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_counter_offers/1
  # DELETE /business_counter_offers/1.json
  def destroy
    @business_counter_offer.destroy
    respond_to do |format|
      format.html { redirect_to business_counter_offers_url, notice: 'Business counter offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_counter_offer
      @business_counter_offer = BusinessCounterOffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_counter_offer_params
      params.require(:business_counter_offer).permit(:business_id, :charity_offer_id, :shortCode, :shortDescription, :longDescription, :amount)
    end
end
