class DealsController < ApplicationController
  before_action :set_deals, only: [:show, :edit, :update, :destroy]
  
  def index
    @deals = Deals.all
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  
end