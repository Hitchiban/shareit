class DevicesController < ApplicationController
  def index
    @devices = Device.all
  end

  def show
    @device = Device.find(params[:id])
  end

  def new

  end

  def create

  end

  private

  def devices_params
  end
end
