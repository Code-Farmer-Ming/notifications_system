class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(tokens,msg,link=nil,scheduled=nil)
    # Do something later
    url = URI("https://api.ionic.io/push/notifications")

    send_object = {tokens: tokens.split(',') ,profile: 'production',notification: {message: msg}}

    if scheduled
      send_object[:scheduled]= DateTime.parse(scheduled).rfc3339
    end
    if link
      send_object[:notification]= {payload: {my_data: link}}
    end
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["authorization"] =  ENV["AUTH_ACCESS_KEY"]
    request["content-type"] = 'application/json'
    request["cache-control"] = 'no-cache'
    request.body =send_object.to_json

    response = http.request(request)
    logger.info response.read_body
  end
end