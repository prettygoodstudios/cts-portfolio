class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout "portfolio"
  access all: [:show, :index, :angular, :sort], user: {except: [:destroy,:new,:create,:update,:edit]}, site_admin: :all
  def index
    @portfolio_items  = Portfolio.by_position
    
  end
  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
  end
  def angular
    @angular_portfolio_items = Portfolio.angular
  end
  def new
  end
  
  # POST /blogs
  # POST /blogs.json
  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your Portfolio Item Is Live.' }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
  end
  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Your Portfolio Item Is Updated.' }
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
  end 
  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'The Portfolio item was removed.' }
    end
  end
  private 
  def portfolio_params
    return params.require(:portfolio).permit(:title, 
                                             :subtitle, 
                                             :body,
                                             :main_image,
                                             :thumb_image,
                                             techonologies_attributes: [:name, :id, :_destroy])
  end
  def set_portfolio_item
     @portfolio_item = Portfolio.find(params[:id])
  end
end

