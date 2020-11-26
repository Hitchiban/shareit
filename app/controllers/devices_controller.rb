class DevicesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @devices = Device.all

    @markers = @devices.geocoded.map do |device|
      {
        lat: device.latitude,
        lng: device.longitude
      }
    end
  end

  def show
    @device = Device.find(params[:id])
    @rent = Rent.new
  end

  def new
    @device = Device.new
  end

  def edit
    @device = Device.find(params[:id])
  end

  def create
    @device = Device.new(device_params)
    @device.user = current_user
    if @device.save
      redirect_to devices_path
    else
      render :new
    end
  end

  def update
    @device = Device.find(params[:id])
    if @device.update(device_params)
      redirect_to @device
    else
      render :edit
    end
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    redirect_to devices_path
  end

  private

  def device_params
    params.require(:device).permit(:name, :description, :address, :price, photos: [])
  end
end
