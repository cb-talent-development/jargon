class APIController < ActionController::Base
  respond_to :json
  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordInvalid, with: :render_validation_error
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def render_validation_error(error)
    render json: error.record.errors.full_messages, status: :unprocessable_entity
  end

  def render_not_found
    render json: {error: "Not Found"}, status: :not_found
  end

  private

  def find_localization!
    @localization = Localization.find_by_id!(params[:id])
  end

  def find_locale!
    find_localization!
    @locale = Locale.find_by_name!(params[:locale_name])
  end
end
