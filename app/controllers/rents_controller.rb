class RentsController < ApplicationController
  def create
    @rent = Rent.new(rent_params)

    @rent.user = current_user
    @rent.device = Device.find(params[:device_id])
    if @rent.save
      redirect_to my_bookings_path
    else
      @device = @rent.device
      render "devices/show"
    end
  end

  def my_bookings
    @my_bookings = Rent.where("user_id = ?", current_user)
  end

  def accepted
    @rent = Rent.find(params[:id])
    @rent.status = "accepted"
    @rent.save
    redirect_to "/my_devices"
  end

  def pending
    @rent = Rent.find(params[:id])
    @rent.status = "pending"
    @rent.save
    redirect_to "/my_devices"
  end

  def refused
    @rent = Rent.find(params[:id])
    @rent.status = "refused"
    @rent.save
    redirect_to "/my_devices"
  end
  
  private

  def rent_params
    params.require(:rent).permit(:date_begin, :date_end, :device_id, :status)
  end
end
