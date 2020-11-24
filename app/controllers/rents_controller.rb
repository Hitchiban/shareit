class RentsController < ApplicationController
  def create
    @rent = Rent.new(rent_params)

    @rent.user = current_user
    @rent.device = Device.find(params[:device_id])
    if @rent.save
      redirect_to device_path(params[:device_id])
    else
      render "device/show"
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:date_begin, :date_end, :device_id, :status)
  end 
end
