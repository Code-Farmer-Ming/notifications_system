class NotificationsController < ApplicationController
  def create
    SendNotificationJob.perform_later(get_params[:user_token],get_params[:content])
    render status: 201
  end

  private

  def get_params
    params.require([:user_token,:content])
    params
  end
end
