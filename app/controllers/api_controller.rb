class APIController < ActionController::Base
  respond_to :json
  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordInvalid, with: :render_error

  def render_error error
    render json: error.record.errors.full_messages, status: :unprocessable_entity
  end
end
