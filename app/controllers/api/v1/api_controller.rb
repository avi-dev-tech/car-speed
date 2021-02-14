class Api::V1::ApiController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json_error(:not_found, 'Record not found')
  end

  private

  def json_error(status, message)
    { json: { message: message }, status: status }
  end
end
