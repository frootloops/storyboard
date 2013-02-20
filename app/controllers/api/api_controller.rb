class Api::ApiController < ActionController::Base
  respond_to :json
  before_filter :verify_authenticity_token
end