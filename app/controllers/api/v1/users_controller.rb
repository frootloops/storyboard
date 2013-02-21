class Api::V1::UsersController < Api::ApiController
  before_filter :verify_authenticity_token, except: :create

  def create
    user = User.new user_params

    if user.save
      render status: :created, json: user, serializer: UserSerializer
    else
      render status: :unauthorized, json: {}
    end
  end

  def update
    current_user.update_attributes! user_params

    render status: :ok, json: current_user, serializer: UserSerializer
  end

  private
  def user_params
    ActionController::Parameters.new(params)
                                .permit(:name, :email, :password, :password_confirmation)
  end
end