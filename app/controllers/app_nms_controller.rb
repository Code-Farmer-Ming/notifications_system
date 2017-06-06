class AppNmsController < ApplicationController
  def create
    SendNotificationJob.perform_later(get_params[:tokens],get_params[:msg],get_params[:title],get_params[:link],get_params[:scheduled])
    render status: 201
  end

  private

  def get_params
    params.require([:tokens,:msg])
    params
  end
end
