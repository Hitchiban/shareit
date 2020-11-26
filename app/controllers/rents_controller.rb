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

  

  private

  def rent_params
    params.require(:rent).permit(:date_begin, :date_end, :device_id, :status)
  end 
end
