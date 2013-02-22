class Api::V1::TokensController < Api::ApiController
  skip_before_filter :verify_authenticity_token
  def create
    user = User.find_by_email params[:email]
    if user.valid_password? params[:password]
      render status: :created, json: user, serializer: UserSerializer
    else
      render status: :unauthorized, json: { message: 'Invalid email or password.' }
    end
  end

  def destroy
    user = User.find_by_token request_token
    user.reset_authentication_token!
    render status: :ok, json: {}
  end

end