class DeviceController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def register
    if Device.where(reg_id: params[:reg_id]).count == 0
      device = Device.new(:reg_id => params[:reg_id], :user_id => params[:user_id], :os => 'android')
      device.save!
    end
    puts Device.all.count
    puts "----register-----"
    render json:{status:200}
  end

  def send_message
    puts "send ------ message"

    render json:{status:200}
  end

  def devices
    render json: Device.all
  end
end
