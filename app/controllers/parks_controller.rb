class ParksController < ApplicationController
  def index
    @parks = Park.all
  end

  def new
    @park = Park.new
    @rangers = Ranger.all
  end

  def create
    Park.create(park_params)
    redirect_to parks_path
  end

  def show
    @park = Park.find(params[:id])
  end

  def edit
    @park = Park.find(params[:id])
  end 

  def update
    @park = Park.find(params[:id]).update(park_params)
    redirect_to(parks_path)

  end

  def destroy
  end

  def park_params
    params.require(:park).permit(:name, :description, :picture, :ranger_ids)
  end

end
