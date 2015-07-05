require 'net/http'
require "uri"
class DeviceController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def register
    puts params
    device_id = params[:reg_id]
    puts "Id: #{device_id}"
    if Device.where(reg_id: device_id).count == 0
      device = Device.new(:reg_id => device_id, :user_id => params[:user_id], :os => 'android')
      device.save!
    end
    puts Device.all.count
    puts "----register-----"
    render json:{status:200}
  end

  def send_message
    title= params[:title]
    body = params[:body]
    reg_id= params[:reg_id]
    url = "https://android.googleapis.com/gcm/send"
    send_params = {
      "data":{
        "title": title,
        "body": body
      },
      registration_ids:[reg_id]
    }
    parsed_url = URI.parse(url)
    result = Net::HTTP.post_form(parsed_url, send_params)
puts result.body

puts url
    render json:{status:200}
  end

  def devices
    render json: Device.all
  end
end
