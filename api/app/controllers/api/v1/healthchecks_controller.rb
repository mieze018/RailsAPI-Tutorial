class Api::V1::HealthchecksController < ApplicationController
  def index
    render json: { request: 'ok' }
  end
end
