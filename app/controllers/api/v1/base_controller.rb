class Api::V1::BaseController < ApplicationController
  respond_to :js, :json
  attr_reader :current_user, :current_school

  rescue_from ActionController::ParameterMissing, ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique, ActiveRecord::StatementInvalid do |e|
    render body: message_from(e), :status => 400
  end

  rescue_from ActionController::MethodNotAllowed do |e|
    render body: message_from(e), :status => 405
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render body: message_from(e), :status => 404
  end

  private

  def authenticate_api
    authenticate_or_request_with_http_token do |token, _options|
      User.find_by_id(token).present?
    end
  end

  def message_from(error)
    error.message.gsub(/.*::/,'').underscore.humanize
  end

end
