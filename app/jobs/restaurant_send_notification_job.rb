class RestaurantSendNotificationJob < ApplicationJob
  queue_as :default

  def perform(tokens,msg,device_type=nil,link=nil,scheduled=nil)
    
    IonicApn.send_nootification(tokens,msg, ENV["RESTAURANT_AUTH_ACCESS_KEY"],link,scheduled)
  end
end
