class OffersController < ApplicationController
  before_action :access
  def index
    @offers = Offer.all
  end
  def show
    @offer = Offer.find(params[:id])
  end
  
  def access
    if logged_in?(:site_admin)
      
    else
      redirect_to root_path
    end
  end
end