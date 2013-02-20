class Api::V1::SessionsController < Api::ApiController
  skip_before_filter :verify_authenticity_token
  def create
    user = User.find_by_email(params[:user][:email])
    if user.valid_password? params[:user][:password]
      render json: user, serializer: UserSerializer
    else
      render status: 401, json: { message: 'Invalid email or password.' }
    end
  end

end