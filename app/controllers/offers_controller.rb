class OffersController < ApplicationController
  before_action :set_offer, only: %i[ show edit]
 
  def index
    @offers = Offer.all
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def edit
  end

  def set_offer
    @offer = Offer.find(params[:id])
   end
   def offer_params
    params.require(:offer).permit(:title, :description)
   end

   def create
    @offer = Offer.new(offer_params)
    respond_to do |format|
    if @offer.save
    format.html { redirect_to offer_url(@offer), notice: "  Offer was successfully
   created." }
    format.json { render :show, status: :created, location: @offer }
    else
    format.html { render :new, status: :unprocessable_entity }
    format.json { render json: @offer.errors, status: :unprocessable_entity }
    end
    end
   end

   def update
    respond_to do |format|
    if @offer = Offer.update(offer_params)
    format.html { redirect_to offer_url(@offer), notice: "Offer was successfully
   updated." }
    format.json { render :show, status: :ok, location: @offer }
    else
    format.html { render :edit, status: :unprocessable_entity }
    format.json { render json: @offer.errors, status: :unprocessable_entity }
    end
    end
   end

   def destroy
    if @offer = Offer.destroy 
    respond_to do |format|
    format.html { redirect_to offers_url, notice: "Offer was successfully destroyed." }
    format.json { head :no_content }
    end
    end
   end
end
