class ProductsController < ApplicationController
   
  
    def index
      @products = Product.all 
    end
  
    # GET /movies/1
    # GET /movies/1.json
    def show
      #  id = params[:id] # retrieve movie ID from URI route
      @product = set_product  #Product.find(id)
    end
  
    # GET /movies/new
    def new
      @product = Product.new
    end
  
    # GET /movies/1/edit
    def edit
      @product = set_product
    end
  
    def create
      @product = Product.create!(product_params)
      flash[:notice] = "#{@product.title} was successfully created."
      redirect_to products_path
    end
  
    # PATCH/PUT /movies/1
    # PATCH/PUT /movies/1.json
    def update
      @product = set_product
      @product.update_attributes!(product_params)
      flash[:notice] = "#{@product.title} was successfully updated."
      redirect_to product_path(@product)
    end
  
    # DELETE /movies/1
    def destroy
      @product = set_product
      @product.destroy
      flash[:notice] = "Product '#{@product.title}' deleted."
      redirect_to products_path
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end
      
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def product_params
        params.require(:product).permit(:productcode, :title, :originalprice, :offer, :status)
      end
  end