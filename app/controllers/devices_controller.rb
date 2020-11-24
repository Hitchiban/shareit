class DevicesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @devices = Device.all
  end

  def show
    @device = Device.find(params[:id])
  end
end
