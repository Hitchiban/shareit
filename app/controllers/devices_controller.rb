class DevicesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:query].present?
      @devices = Device.global_search(params[:query])
    else
      @devices = Device.all
      @markers = @devices.geocoded.map do |device|
        {
          lat: device.latitude,
          lng: device.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { device: device })
        }
      end
    end
  end

  def show
    @device = Device.find(params[:id])
    @rent = Rent.new
    @review = Review.new
    @reviews = @device.reviews
    @average_rating = @reviews.average(:rating)
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
      redirect_to my_devices_path
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
    redirect_to my_devices_path
  end

  def my_devices
    @my_devices = Device.where("user_id = ?", current_user)
    @booked_devices = Rent.where(device: @my_devices)
  end

  private

  def device_params
    params.require(:device).permit(:name, :description, :address, :price, :brand, :controller, :game, photos: [])
  end
end
