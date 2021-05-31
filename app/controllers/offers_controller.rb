class OffersController < ApplicationController
  
    def index
     # @offers = Offer.all 
    end
end
=begin
    
    # GET /movies/1
    # GET /movies/1.json
    def show
      #  id = params[:id] # retrieve movie ID from URI route
      @offer = set_offer  #Offer.find(id)
    end
  
    # GET /movies/new
    def new
      @offer = Offer.new
    end
  
    # GET /movies/1/edit
    def edit
      @offer = set_offer
    end
  
    def create
      @offer = Offer.create!(offer_params)
      flash[:notice] = "#{@offer.title} was successfully created."
      redirect_to offers_path
    end
  
    # PATCH/PUT /movies/1
    # PATCH/PUT /movies/1.json
    def update
      @offer = set_offer
      @offer.update_attributes!(offer_params)
      flash[:notice] = "#{@offer.title} was successfully updated."
      redirect_to offer_path(@offer)
    end
  
    # DELETE /movies/1
    def destroy
      @offer = set_offer
      @offer.destroy
      flash[:notice] = "Offer '#{@offer.title}' deleted."
      redirect_to offers_path
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_offer
        @offer = Offer.find(params[:id])
      end
      
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def offer_params
        params.require(:offer).permit(:offercode, :title, :description, :create_date)
      end
end  
=end
  