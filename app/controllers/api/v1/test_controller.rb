class Api::V1::TestController < ApplicationController
  before_action :doorkeeper_authorize!

  def ping
    render json: { message: "Pong! You are authorized ✅", user_id: current_resource_owner.id }
  end

  private

  # Tells Doorkeeper who the resource owner is
  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end