class Api::ApiController < ActionController::Base
  respond_to :json

  protected
  def request_token
    request.headers["Authorization"]
  end

  def verify_authenticity_token
    @current_user = User.find_by_token request_token

    render status: :unauthorized, json: {} unless @current_user
  end

  def current_user
    @current_user
  end
end