class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(tokens,msg,title=nil,link=nil,scheduled=nil)
    tokens = tokens.split(',').reject(&:blank?)
    ionic_tokens =  tokens.select{|item| item.size>60}
    other_tokens =  tokens.select{|item| item.size<60}
    if ionic_tokens.present?
      IonicApn.send_notification(ionic_tokens,msg,ENV["AUTH_ACCESS_KEY"],link,scheduled)
    end
    if other_tokens.present?
      JiguangApn.send_notification(other_tokens,msg,ENV["JPUSH_AUTH_ACCESS_KEY"],title,link,scheduled)
    end
  end
end
