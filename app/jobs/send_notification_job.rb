class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(tokens,msg,device_type=nil,link=nil,scheduled=nil)
    IonicApn.send_nootification(tokens,msg,ENV["AUTH_ACCESS_KEY"],link,scheduled)
  end
end
